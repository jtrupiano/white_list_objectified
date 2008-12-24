module WhiteListParameterFiltering
  
  @@white_lister ||= WhiteLister.new
  
  # kind of limited as this currently stands
  def white_list_params!(obj, method)
    if !params[obj].nil? && params[obj].is_a?(Hash) && !params[obj][method].nil?
      params[obj][method] = @@white_lister.white_list(params[obj][method])
    end
  end
  
  def white_list_all_params!(obj)
    if !params[obj].nil? && params[obj].is_a?(Hash)
      for key in params[obj].keys do
        params[obj][key] = @@white_lister.white_list(params[obj][key]) if params[obj][key].is_a?(String)
      end
    end
  end
end