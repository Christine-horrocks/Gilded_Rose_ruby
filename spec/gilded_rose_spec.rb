require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'increments sell_in of average item -1' do
      items = [Item.new("bread", 5, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(4)
    end

    it 'increments quality of average item -1' do
      items = [Item.new("bread", 5, 7 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(6)
    end

    it 'increments quality of average item -2 after sell_in date' do
      items = [Item.new("bread", 0, 7 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(5)
    end

    it 'quality of average item doesnt go negative' do
      items = [Item.new("bread", 0, 1 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it 'increments sell_in of Aged Brie -1' do
      items = [Item.new("Aged Brie", 5, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(4)
    end

    it 'increments quality of Aged Brie +1' do
      items = [Item.new("Aged Brie", 5, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(7)
    end

    it 'increments quality of Aged Brie dosent go over 50' do
      items = [Item.new("Aged Brie", 5, 50 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(50)
    end

    it 'increments sell_in of Backstage passes -1' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(4)
    end

    it 'increments quality of Backstage passes with < 10 sell_in +1' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(7)
    end

    it 'increments quality of Backstage passes with 10-6 sell_in +2' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(8)
    end

    it 'increments quality of Backstage passes with 5-1 sell_in +3' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 4, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(9)
    end

    it 'deletes all quality of Backstage passes with 0 sell_in' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(0)
    end

    it 'doesnt change sell_in of Sulfuras' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 6 )]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(5)
    end

    it 'doesnt change quality of Sulfuras' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 7 )]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(7)
    end

  end

end
