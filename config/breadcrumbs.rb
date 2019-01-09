crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path
end

crumb :categories do
  link "カテゴリ一覧", categories_path
end

crumb :brands do
  link "ブランド一覧", brands_path
end

crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end

crumb :category do |category|
  link "#{category.name}", category_path(params[:id])
  parent :categories
end

crumb :searchkeyword do |keyword|
  link "#{keyword[:name_cont]}"
end

crumb :item_name do |item|
  link "#{item.name}", item_path(params[:id])
end
