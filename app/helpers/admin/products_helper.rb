module Admin::ProductsHelper
  def convert_info info
    info.length > 20 ? info[0,20]+"......" : info
  end

  def load_categorie_name id
    @categrie = @categories.find_by id: id
    @categrie.nil? ? t("N_A") : @categrie.name
  end
end
