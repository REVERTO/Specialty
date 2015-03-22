# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'

namespace :scrape_task do
  desc "Say hello world"
  task :wiki_specialty => :environment do
# スクレイピング先のURL
url = 'http://ja.wikipedia.org/wiki/%E7%89%B9%E7%94%A3%E5%93%81#.E6.97.A5.E6.9C.AC.E5.90.84.E5.9C.B0.E3.81.AE.E7.89.B9.E7.94.A3.E5.93.81'

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML.parse(html, nil, charset)

# タイトルを表示
# p doc.title

# 地域と特産物を表示
doc.xpath("//table/tr").each do |child|
	elements = child.xpath("td/a")
	if elements.empty? then next end
	# 地域名
	lname = elements[0]['title'] 
	p lname
	local = Local.create(name: lname)
	# 特産物
	if elements.length == 1 then next end
	1.upto(elements.length) do |i|
		unless elements[i].nil? || elements[i]['title'].empty?
			pname = elements[i]['title']
			p pname
			Product.create(name: pname, local: local)
		end
	end
	p ''
end
  end
end
