require "csv"

class Memo
  def initialize
     puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する / 3 → メモを削除 / 9 → 終了"
  end 
  
  def start
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する / 3 → メモを削除 / 9 → 終了"
  end 
  
  def new_input
    puts "新規メモを入力"
    puts "タイトルを入力してください（半角英数字）" 
    title = gets.chomp
    csv_title = title + ".csv"
    puts "メモを入力 (Ctrl+Dで完了)"
    #例外処理
    begin
      file =File.open(csv_title, "w") 
    rescue => e
      puts "---入力エラー---"
      puts e.message
      return
    end
    document =readlines
    file.write(document)
    file.close
    puts "------------------------------------------------                                                  "
  end 
  
  def edit_file
    puts "編集するメモのファイル名を入力(拡張子を除く)" 
    title = gets.chomp
    csv_title = title + ".csv"
    #例外処理
    begin
      file = File.open(csv_title, "a+")
    rescue => e
      puts "---入力エラー---"
      puts e.message
      return
    end
    puts file.read
    puts "追記する内容を入力してください(Ctrl+Dで完了)"
    document = readlines
    file.write(document)
    file.close
    puts "------------------------------------------------
                                                     "
  end 
  
  def delete_file #例外処理
    puts "削除するメモのファイル名を入力してください(拡張子を除く)"
    title = gets.chomp
    csv_title = title + ".csv"
    begin
      File.delete(csv_title)
    rescue => e
      puts "---入力エラー---"
      puts e.message
      return
    end
    puts "------------------------------------------------                                                    "
  end
  
  def error
    puts "入力が正しくありません。再入力してください。"
    puts "------------------------------------------------                                                     "
  end 
  
  def quit
    puts "終了します"
  end 
  
end 

memo = Memo.new
memo_type = gets.to_i 

while memo_type != 9 do
  case memo_type
  when 1
    memo.new_input
    
  when 2
    memo.edit_file
    
  when 3
    memo.delete_file
  else
    memo.error
    
  end 
  memo.start
  memo_type = gets.to_i
end

memo.quit

