tags = %w(学習 転職活動 豆知識 その他)
tags.each { |tag| Tag.find_or_create_by!(name: tag) }

3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = 'test1234'
  end

  50.times do |ii|
    ii += 1
    user.articles.find_or_create_by!(title: "No.#{ii}: user00#{i}の記事") do |article|
      article.content = "No.#{ii}: user00#{i}の記事の本文"
        article.tag_ids = Tag.all.pluck(:id)
    end
  end
end
