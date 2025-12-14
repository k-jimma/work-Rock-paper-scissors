hands = ["グー", "チョキ", "パー"]
directions = ["上", "下", "左", "右"]

def read_choice(prompt, range)
  puts prompt
  begin
    input = gets
    raise ArgumentError, "入力がありません" unless input
    choice = Integer(input.chomp)
    raise ArgumentError, "範囲外です" unless range.include?(choice)
    choice
  rescue ArgumentError
    puts "0から#{range.max}の数字を入力してください。ゲームを終了します。"
    exit
  end
end

puts "じゃんけん..."
user_hand = read_choice("0(グー)1(チョキ)2(パー)3(戦わない)", 0..3)

if user_hand == 3
  puts "ゲームを終了します。"
  exit
end

computer_hand = rand(0..2)
puts "ホイ！"
puts "----------------"
puts "あなたは#{hands[user_hand]}を出しました"
puts "相手は#{hands[computer_hand]}を出しました"
puts "----------------"

if user_hand == computer_hand
  loop do
    puts "あいこで..."
    user_hand = read_choice("0(グー)1(チョキ)2(パー)3(戦わない)", 0..3)
    if user_hand == 3
      puts "ゲームを終了します。"
      exit
    end

    computer_hand = rand(0..2)
    puts "ショ！"
    puts "----------------"
    puts "あなたは#{hands[user_hand]}を出しました"
    puts "相手は#{hands[computer_hand]}を出しました"
    puts "----------------"

    if user_hand != computer_hand
      break
    end
  end
end

puts "あっち向いて..."
user_direction = read_choice("0(上)1(下)2(左)3(右)", 0..3)
computer_direction = rand(0..3)
puts "ホイ！"
puts "----------------"
puts "あなたは#{directions[user_direction]}を向きました"
puts "相手は#{directions[computer_direction]}を向きました"
puts "----------------"

player_wins = (user_hand == 0 && computer_hand == 1) ||
              (user_hand == 1 && computer_hand == 2) ||
              (user_hand == 2 && computer_hand == 0)

if player_wins
  if user_direction == computer_direction
    puts "あなたの勝ちです！"
  else
    puts "引き分けです。"
  end
else
  if user_direction == computer_direction
    puts "あなたの負けです。"
  else
    puts "引き分けです。"
  end
end
