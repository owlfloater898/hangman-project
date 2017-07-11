class Drawing
  def self.draw_outs(outs)
    case outs
    when 0
puts " ┌────┐
 │    │
      │
      │
      │
      │
──────┴──"

    when 1
puts " ┌────┐
 │    │
 ▄    │
      │
      │
      │
──────┴──"

    when 2
puts " ┌────┐
 │    │
 ▄    │
 │    │
 │    │
      │
──────┴──"

    when 3
puts " ┌────┐
 │    │
 ▄    │
 ├┐   │
 │    │
      │
──────┴──"

    when 4
puts " ┌────┐
 │    │
 ▄    │
┌┼┐   │
 │    │
      │
──────┴──"

    when 5
puts " ┌────┐
 │    │
 ▄    │
┌┼┐   │
┌┘    │
      │
──────┴──"
    when 6
puts " ┌────┐
 │    │
 ▄    │
┌┼┐   │
┌┴┐   │
      │
──────┴──"        
    end
  end

  def self.draw_free
    3.times do
        system('clear')
        puts " ┌────┐
      │
\e[33m* * *\e[0m │
  ▄   │
 └┼┘  │
 ┌┴┐  │
──────┴──"
        sleep(0.25)
        system('clear')
        puts " ┌────┐
      │
      │
  ▄   │
 ┌┼┐  │
 ┌┴┐  │
──────┴──"   
        sleep(0.25)  
    end
  end
  def self.draw_hanged
        3.times do
        system('clear')
        puts " ┌────┐
 │    │
 ▄    │
┌┼┐   │
┌┴┐   │
      │
──────┴──"      
        sleep(0.25)
        system('clear')
        puts " ┌────┐
 │    │
  ▄   │
┌┼┐\e[31m.\e[0m  │
┌┴┐\e[31m.\e[0m  │
   \e[31m.\e[0m  │
──────┴──"      
        sleep(0.25)  
    end
  end
end