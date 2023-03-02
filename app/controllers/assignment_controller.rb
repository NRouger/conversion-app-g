class AssignmentController < ApplicationController
  # def index
  # end

  def conversion
    if params[:q]
      query = params[:q].split(" ")
      value = query[0].to_f
      # from_unit = query[0].scan(/[a-zA-Z]/).join('')
      # from_unit = query.first.to_s
      # from_unit = query[1]
      to_unit = query.last

      
      if %w[kg lb m metre ft feet].include?(query[0].scan(/[a-zA-Z]/).join(''))
        from_unit = query[0].scan(/[a-zA-Z]/).join('')
      elsif %w[kg lb m metre ft feet].include?(query[1])
        from_unit = query[1]
      else
        from_unit = nil
      end
      # render plain: from_unit
      # render plain: from_unit
      case [from_unit, to_unit]
      when ['kg', 'lb']
        converted_value = value * 2.20462
      when ['lb', 'kg']
        converted_value = value / 2.20462
      when ['m', 'ft']
        converted_value = value * 3.28084
      when ['metre', 'feet']
        converted_value = value * 3.28084
      when ['ft', 'm']
        converted_value = value / 3.28084
      when ['feet', 'metre']
        converted_value = value / 3.28084
      else
        converted_value = value
      end
      render plain: "#{converted_value}"
    end
  end

  # def conversion
    # query = params[:q]
    # valor, unidad = query.split(' ')
    # valor_numerico = valor.gsub(/[^\d.]/, '').to_f
    # unidad = unidad
    # # unidad = unidad.gsub
    # render plain: "El valor es #{valor_numerico} y la unidad es #{unidad}"
    # render plain: 'OK'
  # end

  # def conversion
  #   url = request.original_url
  #   # render plain: "Esta es tu url #{url}"
  #   uri = URI.parse(url)
  #   params = CGI.parse(uri.query)

  #   render plain: "Este es tu uri #{params}"
  # end

  # def conversion
  #   query_param = params[:q]
  #   if query_param.include?('kg')

  #   else

  #   end
  #   # if query_param
  #   #   kg = query_param.to_f
  #   #   lb = (kg * 2.20462)
  #   #   render plain: "#{lb.to_f}"
  #   # else
  #   #   render plain: 'The query parameter is invalid'
  #   # end
  # end
end
