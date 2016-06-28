require "spec_helper"

describe ClimaTempo do
  it "missing code" do
    expect { ClimaTempo.new }.to raise_error(ArgumentError)
  end

  context "values from São Paulo" do
    before do
      fixture = File.open("spec/fixture/sao_paulo.html").read
      FakeWeb.register_uri(:any, "http://www.climatempo.com.br/previsao-do-tempo/cidade/558", body: fixture)
    end

    it "now's values" do
      clima_tempo = ClimaTempo.new(558).now

      expect(clima_tempo[:temperature]      ).to eq("15")
      expect(clima_tempo[:thermal_sensation]).to eq("16")
      # expect(clima_tempo[:wind]             ).to eq("Su-sudeste")
      expect(clima_tempo[:condition]        ).to eq("Tempo firme")
      expect(clima_tempo[:pressure]         ).to eq("1028 hPa")
      expect(clima_tempo[:intensity]        ).to eq("4 km/h ")
      expect(clima_tempo[:moisture]         ).to eq("82%")
    end

    it "today forecast's values" do
      clima_tempo = ClimaTempo.new(558).today_forecast

      expect(clima_tempo[:condition]).to eq("Dia de sol, com nevoeiro ao amanhecer. As nuvens aumentam no decorrer da tarde.")
      expect(clima_tempo[:min]).to eq("12")
      expect(clima_tempo[:max]).to eq("24")
      expect(clima_tempo[:probability_of_precipitation]).to eq("0%")
      expect(clima_tempo[:volume_of_precipitation]).to eq("0mm")
    end
  end
end
