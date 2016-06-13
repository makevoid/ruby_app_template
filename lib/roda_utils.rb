module RodaUtils
  def body_class
    request.path.split("/")[1]
  end

  def js_void
    "javascript:void(0)"
  end
end
