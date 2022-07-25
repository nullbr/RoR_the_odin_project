require 'csv'

text = File.open('text.txt', 'w')

CSV.foreach('planilha1.csv') do |row|
  text << if row[0] == '?' || row[1] == '?'
            "#{row[2]}\n".lstrip
          else
            "#{row[0]} - #{row[1]}\n".lstrip
          end
end

description = File.open('description.txt', 'w')

CSV.foreach('planilha1.csv') do |row|
  description << if row[0] == '?'
                   "#{row[1]} - #{row[2]}<div><br />".lstrip
                 elsif row[1] == '?'
                   "#{row[0]} - #{row[2]}<div><br />".lstrip
                 else
                   "#{row[0]} - #{row[1]} - #{row[2]}<div><br />".lstrip
                 end
  description << '<div><div><div>Localização: Sertanopolis/PR</div><div><br />'\
  '</div><div>Informações Relevantes: (MAS NÃO SE LIMITANDO A): '\
  'Bens usados, venda no estado de conservação em que se encontra.'\
  '</div><div><br /></div><div>Observações:</div><div>1. '\
  'Leia atentamente o edital do leilão, nele estão todas as regras '\
  'e condições de venda.</div><div>2. Bens de uso frequente e pesado, '\
  'podendo apresentar riscos, problemas e avarias em geral. '\
  'O arrematante deve avaliar todas estas questões para decisão de '\
  'compra durante a visitação.</div><div>3. Bens não testados. '\
  'A responsabilidade dos testes e da avaliação das condições do '\
  'bem é por conta do arrematante e na impossibilidade de testar, '\
  'obter informações ou visitar os bens, recomendamos que não efetue '\
  'os lances. A avaliação em geral da viabilização de arrematação '\
  'será uma opção exclusiva dos arrematantes.</div><div>4. '\
  'Imagens meramente ilustrativas.</div></div></div></div><div>'\
  "<br /></div>\n"
end

prices = File.open('prices.txt', 'w')

CSV.foreach('prices.csv') do |row|
  increment = if row[5].scan(/\d/).join[0..-3].to_i < 7500
                "R$ 100,00"
              elsif row[5].scan(/\d/).join[0..-3].to_i < 20000
                "R$ 500,00"
              else
                "R$ 1.000,00"
              end
  prices << "#{row[5]};#{increment};#{row[4]}\n".lstrip
end