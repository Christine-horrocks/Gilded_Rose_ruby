class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        update_aged_brie(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        update_sulfuras(item)
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
      reduce_item_sell_in(item)
      if item.quality > 0 && item.sell_in > 0
        reduce_item_quality(item, 1)
      elsif item.quality > 1 && item.sell_in < 0
        reduce_item_quality(item, 2)
      elsif item.quality == 1 && item.sell_in < 0
        reduce_item_quality(item, 1)
      else
        item.quality = item.quality
      end
    end

    def update_sulfuras(item)
      item.sell_in = item.sell_in
      item.quality = item.quality
    end

    def update_aged_brie(item)
      reduce_item_sell_in(item)
      if item.quality < 50
        add_item_quality(item, 1)
      end
    end

    def update_backstage_pass(item)
      reduce_item_sell_in(item)
      if item.quality > 49
        item.quality = item.quality
      elsif item.sell_in < 0
        item.quality = 0
      elsif item.sell_in < 5
        add_item_quality(item, 3)
      elsif item.sell_in < 10
        add_item_quality(item, 2)
      else
        add_item_quality(item, 1)
      end
    end

    def update_conjured(item)
      reduce_item_sell_in(item)
      if item.quality > 1 && item.sell_in > 0
        reduce_item_quality(item, 2)
      elsif item.quality < 2 && item.sell_in > 0
        item.quality = 0
      elsif item.quality > 3 && item.sell_in < 0
        reduce_item_quality(item, 4)
      elsif item.quality < 4 && item.sell_in < 0
        item.quality = 0
      else
        item.quality = item.quality
      end
    end

    def reduce_item_sell_in(item)
      item.sell_in = item.sell_in - 1
    end

    def add_item_quality(item, num)
      item.quality = item.quality + (num)
    end

    def reduce_item_quality(item, num)
      item.quality = item.quality - (num)
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
