module Admin::ProductsHelper
  def convert_info
    @products.each do |p|
      p.info.length > 20 ? p.info = p.info[0,20]+"......" : p.info
    end
  end

  def load_categorie_name id
    @categrie = @categories.find_by id: id
    @categrie.nil? ? t("N_A") : @categrie.name
  end
end
