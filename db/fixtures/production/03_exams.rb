Exam.seed(
  :id,
  { id: 1, title: '難読漢字テスト(野菜・果物)', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 2, title: '難読漢字テスト(動物)', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 3, title: '難読漢字テスト(魚)', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 4, title: '難読漢字テスト(外来語)', deadline: '2020-12-31', release: true, subject_id: 1 },
  { id: 5, title: '難読漢字テスト(言葉)', deadline: '2020-12-31', release: true, subject_id: 1 },
)

Question.seed(
  :id,
  { id: 1,  content: "次の漢字の読みを答えなさい。\n「玉葱」\n① にんじん\n② たまねぎ\n③ じゃがいも\n④ ぴーまん", correct_answer: 2, description: 'これは大丈夫でしょう！ウォーミングアップですね！', exam_id: 1 },
  { id: 2,  content: "次の漢字の読みを答えなさい。\n「西瓜」\n① すいか\n② きゅうり\n③ へちま\n④ かぼちゃ", correct_answer: 1, description: '実はどれも「瓜」がつく漢字です。全部わかるかな？', exam_id: 1 },
  { id: 3,  content: "次の漢字の読みを答えなさい。\n「赤茄子」\n① とうがらし\n② ぱぷりか\n③ とまと\n④ はばねろ", correct_answer: 3, description: '「蕃茄」などと書くこともあります。勉強になりますね！', exam_id: 1 },
  { id: 4,  content: "次の漢字の読みを答えなさい。\n「糵」\n① ごま\n② にんにく\n③ もやし\n④ れたす", correct_answer: 3, description: 'もやしってこんな漢字なんですね〜！', exam_id: 1 },
  { id: 5,  content: "＜ラストです！これができたらスゴい！！＞\n\n次の漢字の読みを答えなさい。\n「鰐梨」\n① あぼかど\n② あすぱらがす\n③ ぱっしょんふるーつ\n④ ぶろっこりー", correct_answer: 1, description: 'できたかな？とっても難しい漢字ですね！', exam_id: 1 },

  { id: 6,  content: "次の漢字の読みを答えなさい。\n「土竜」\n① へび\n② つちのこ\n③ みみず\n④ もぐら", correct_answer: 4, description: 'かっこいい漢字ですね！', exam_id: 2 },
  { id: 7,  content: "次の漢字の読みを答えなさい。\n「海豚」\n① くらげ\n② まんぼう\n③ くじら\n④ いるか", correct_answer: 4, description: 'こんなにかわいいのに豚って…。。。', exam_id: 2 },
  { id: 8,  content: "次の漢字の読みを答えなさい。\n「子守熊」\n① あなぐま\n② こあら\n③ とど\n④ かんがるー", correct_answer: 2, description: 'これは難しい！！', exam_id: 2 },
  { id: 9,  content: "次の漢字の読みを答えなさい。\n「倉鼠」\n① りす\n② もるもっと\n③ はむすたー\n④ はつかねずみ", correct_answer: 3, description: 'ハムスターにこんな漢字があるんですね！！', exam_id: 2 },
  { id: 10, content: "＜ラストです！これができたらスゴい！！＞\n\n次の漢字の読みを答えなさい。\n「鼈」\n① すっぽん\n② むつごろう\n③ なまけもの\n④ さい", correct_answer: 1, description: 'これは超難問！できたら天才！', exam_id: 2 },

  { id: 11, content: "次の漢字の読みを答えなさい。\n「鮪」\n① まぐろ\n② はまち\n③ さより\n④ はも", correct_answer: 1, description: 'お寿司の定番ですね♪', exam_id: 3 },
  { id: 12, content: "次の漢字の読みを答えなさい。\n「鱈」\n① いわし\n② たら\n③ あじ\n④ さば", correct_answer: 2, description: 'こちらも有名ですね！', exam_id: 3 },
  { id: 13, content: "次の漢字の読みを答えなさい。\n「鱚」\n① ぶり\n② はまち\n③ きす\n④ さけ", correct_answer: 3, description: 'なかなか難しかったのではないでしょうか！', exam_id: 3 },
  { id: 14, content: "次の漢字の読みを答えなさい。\n「柳葉魚」\n① めばる\n② たちうお\n③ さんま\n④ ししゃも", correct_answer: 4, description: 'ししゃもってこんな漢字を書くんですね〜！', exam_id: 3 },
  { id: 15, content: "＜ラストです！これができたらスゴい！！＞\n\n次の漢字の読みを答えなさい。\n「海鷂魚」\n① えい\n② はぜ\n③ しゃこ\n④ すずき", correct_answer: 1, description: 'これできたあなたは…すごすぎ。', exam_id: 3 },

  { id: 16, content: "次の漢字の読みを答えなさい。\n「珈琲」\n① こーひー\n② こうちゃ\n③ みるく\n④ みず", correct_answer: 1, description: 'これは大丈夫でしょう！', exam_id: 4 },
  { id: 17, content: "次の漢字の読みを答えなさい。\n「檸檬」\n① おれんじ\n② れもん\n③ らいむ\n④ みかん", correct_answer: 2, description: 'これもわりと有名ですね！', exam_id: 4 },
  { id: 18, content: "次の漢字の読みを答えなさい。\n「提琴」\n① ぎたー\n② まりんば\n③ しゃみせん\n④ ばいおりん", correct_answer: 4, description: 'バイオリンってこんな漢字なんですね！', exam_id: 4 },
  { id: 19, content: "次の漢字の読みを答えなさい。\n「洋袴」\n① しゃつ\n② そっくす\n③ ずぼん\n④ どれす", correct_answer: 3, description: '「洋」風な「袴(はかま)」というワードから推測できますね！', exam_id: 4 },
  { id: 20, content: "＜ラストです！これができたらスゴい！！＞\n\n次の漢字の読みを答えなさい。\n「乾蒸餅」\n① くらっかー\n② びすけっと\n③ かすてら\n④ ふぃなんしぇ", correct_answer: 2, description: 'これはなかなか予想しても難しかったのではないでしょうか！', exam_id: 4 },

  { id: 21, content: "次の漢字の読みを答えなさい。\n「強ち」\n① すなわち\n② あながち\n③ たちまち\n④ さきだち", correct_answer: 2, description: '「強」のイメージから連想できますね！', exam_id: 5 },
  { id: 22, content: "次の漢字の読みを答えなさい。\n「悉く」\n① おののく\n② あくせく\n③ しばらく\n④ ことごとく", correct_answer: 4, description: '「悉」には「全て」という意味があります！', exam_id: 5 },
  { id: 23, content: "次の漢字の読みを答えなさい。\n「偏に」\n① にわかに\n② かたくなに\n③ ひとえに\n④ つぶさに", correct_answer: 3, description: '「これもひとえに…」っていうアレですね！', exam_id: 5 },
  { id: 24, content: "次の漢字の読みを答えなさい。\n「鏤める」\n① ちりばめる\n② はずかしめる\n③ しずめる\n④ すすめる", correct_answer: 1, description: '「鏤」は「金属を細かく彫る、刻む」といった意味があります！', exam_id: 5 },
  { id: 25, content: "＜ラストです！これができたらスゴい！！＞\n\n次の漢字の読みを答えなさい。\n「擽る」\n① はじける\n② けしかける\n③ くすぐる\n④ あざける", correct_answer: 3, description: '「擽ったい」なんて言葉も普段漢字で見ないものですね！', exam_id: 5 },

)
