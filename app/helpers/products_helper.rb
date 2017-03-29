module ProductsHelper
  def convert_info
    @products.each do |p|
      p.info.length > 20 ? p.info = p.info[0,20]+"......" : p.info
    end
    @products
  end
end
