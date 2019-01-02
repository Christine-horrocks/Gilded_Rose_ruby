class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        update_aged_brie(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        return
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage_pass(item)
      elsif item.name.downcase.include? "conjured"
        update_conjured(item)
      else
        update_average_item(item)
      end
    end
  end

  private
    def update_average_item(item)
      item.sell_in -= 1
      return if item.quality == 0

      item.quality -= 1
      item.quality -= 1 if item.sell_in <= 0 && item.quality >= 1
    end

    def update_aged_brie(item)
      item.sell_in -= 1
      return if item.quality >= 50

      item.quality += 1
    end

    def update_backstage_pass(item)
      item.sell_in -= 1
      return item.quality = 0 if item.sell_in < 0
      return if item.quality >= 50

      item.quality += 1
      item.quality += 1 if item.sell_in < 10
      item.quality += 1 if item.sell_in < 5
    end

    def update_conjured(item)
      item.sell_in -= 1
      return if item.quality == 0

      item.quality -= 1
      item.quality -= 1 if item.quality >= 1
      item.quality -= 1 if item.sell_in < 1 && item.quality >= 1
      item.quality -= 1 if item.sell_in < 1 && item.quality >= 1
    end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
