class API < Grape::API

  # APIアクセスに接頭語を不可
  # ex) http://localhost:3000/api
  prefix "api"

  # APIアクセスにバージョン情報を付加
  # ex) http://localhost:3000/api/v1/
  version 'v1', :using => :path

  # 未指定の場合にJSONで返すように変更（URLで指定可能）
  format :json

  mount Locals_API
  mount Products_API
end
