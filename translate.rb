
require 'yandex-translator'

class Tradutor

  def tradutor
    translator = Yandex::Translator.new('trnsl.1.1.20200403T204043Z.f51aece49cfc3d12.5668cca2879314654a8f6307822d3a36ffe6a12c')
    end

  def linguas
    tradutor.langs
  end



end



