// extension String.StringInterpolation {
//     mutating func appendInterpolation(_ value: Int) {
//         let formatter = NumberFormatter()
//         formatter.numberStyle = .spellOut

//         if let result = formatter.string(from: value as NSNumber) {
//             appendLiteral(result)
//         }
//     }
// }



class Team {

    var name:String
    var rating:Int
    var strength:String
    var weakness:String
    var wins:Int
    var games:Int
    let conference:String
    init(myName:String, myRating:Int, myStrength:String, myWeakness:String, myConference:String){
        name = myName
        rating = myRating
        strength = myStrength
        weakness = myWeakness
        conference = myConference
        wins = 0
        games = 0
    }
    func getName() -> String {
        return name
        }
    func setName(realName: String) {
         name = realName
        }
    func getRating() -> Int{
        return rating
    }
    func setRating(realRating: Int) {
        rating = realRating
    }
    func getStrength()-> String{
         return strength
    }
    func setStrength(realStrength: String){
        strength = realStrength
    }
    func getWeakness()-> String{
         return weakness
    }
    func setWeakness(realWeakness: String){
        weakness = realWeakness
    }
     func getWins() -> Int {
        return wins
        }
    func gameWon() {
         wins = wins+1
        }
   
    func getGames() -> Int {
        return games
        }
    func gamePlayed() {
        games = games+1
    }
    func reset(){
      games = 0
      wins = 0
    }
    }




func toString(obj:Team){
    let losses = 82 - obj.wins 
    print("The \(obj.name):\nRating: \(obj.rating)\nStrength: \(obj.strength)\nWeakness: \(obj.weakness)")
    print()
}

func schedule(teams:[Team])->[Team]{
    
    for team in teams{
    var i = 0
        while(team.games < 82){
            if(teams[i%30].name != team.name && teams[i%30].games < 82){
                simulate(team1 : team, team2: teams[i%30])
                team.gamePlayed()
                teams[i%30].gamePlayed()
            }
            i = i+1
        }
    }
    return(standings(NBAteams:teams))
}

func simulateP(team1: Team, team2: Team)->Team {
  var diff:Double 
    var factor:Double = 0
    var number:Int
   if(team1.rating > team2.rating){
    diff = Double(team1.rating - team2.rating) 
    factor = diff * 1.75
    if(team1.weakness == team2.strength){
        factor = factor - 5
    }
    if(team2.weakness == team1.strength){
        factor = factor + 5
    }
   // number = drand48() * 100
   number = Int.random(in:0...100) //raarc4random(255)%100
    if(number <= Int(factor + 50)){
        return team1
    }
    else{
        return team2
    }
    }
    if(team2.rating > team1.rating){
    diff = Double(team2.rating - team1.rating)
    factor = diff * 1.75
    if(team1.weakness == team2.strength){
        factor = factor + 5
    }
    if(team2.weakness == team1.strength){
        factor = factor - 5
    }
    // number = drand48() * 100
    number = Int.random(in:0...100)
    if(number <= Int(factor + 50)){
        return team2
    }
    else{
        return team1
    }
    }
    if(team1.rating == team2.rating){
    
    if(team1.weakness == team2.strength){
        factor = factor - 5
    }
    if(team2.weakness == team1.strength){
        factor = factor + 5
    }
   // number =  Int(arc4random_uniform(UInt32(6)))
    number = Int.random(in:0...100)
    if(number <= Int(factor + 50)){
        return team1
    }
    else{
        return team2
    }
    }
    let team3 = Team(myName:"NULL", myRating:0 ,myStrength:"NULL", myWeakness:"NULL", myConference:"NULL")
    return team3
}



func simulate(team1: Team, team2: Team){
    var diff:Double 
    var factor:Double = 0
    var number:Int
   if(team1.rating > team2.rating){
    diff = Double(team1.rating - team2.rating) 
    factor = diff * 1.75
    if(team1.weakness == team2.strength){
        factor = factor - 5
    }
    if(team2.weakness == team1.strength){
        factor = factor + 5
    }
   // number = drand48() * 100
   number = Int.random(in:0...100) //raarc4random(255)%100
    if(number <= Int(factor + 50)){
        team1.gameWon()
    }
    else{
        team2.gameWon()
    }
    }
    if(team2.rating > team1.rating){
    diff = Double(team2.rating - team1.rating)
    factor = diff * 1.75
    if(team1.weakness == team2.strength){
        factor = factor + 5
    }
    if(team2.weakness == team1.strength){
        factor = factor - 5
    }
    // number = drand48() * 100
    number = Int.random(in:0...100)
    if(number <= Int(factor + 50)){
        team2.gameWon()
    }
    else{
        team1.gameWon()
    }
    }
    if(team1.rating == team2.rating){
    
    if(team1.weakness == team2.strength){
        factor = factor - 5
    }
    if(team2.weakness == team1.strength){
        factor = factor + 5
    }
   // number =  Int(arc4random_uniform(UInt32(6)))
    number = Int.random(in:0...100)
    if(number <= Int(factor + 50)){
        team1.gameWon()
    }
    else{
        team2.gameWon()
    }
    }
    
}

func standings( NBAteams:[Team])->[Team]{
   var newList = NBAteams
   newList.sort(by: { (first: Team, second: Team) -> Bool in first.wins > second.wins})
    var i = 0
    print("         WESTERN Conference      ")
    for team in newList{
      if(team.conference == "West"){
    i = i+1
    print(i, " ",team.name, " ",team.wins, "-", (82-team.wins))
      }
            }
          i = 0
    print()
    print()
     print("         Eastern Conference      ")
    for team in newList{
      if(team.conference == "East"){
     i = i+1
    print(i, " ",team.name, " ",team.wins, "-", (82-team.wins))
      }
            }
            print()
    return newList
}

func showTeamStats(teams:[Team]){
  for team in teams{
    toString(obj: team)
  }
//   print("Enter a team name to change their stats (City TeamName)")
//   let input = readLine()
//   for team in teams{
//     if (team.name == input){
//       print("What would you like to change")
//       print("(1)Strength")
//       print("(2)Weakness")
//       let choice = readLine()
//       if(choice == "1"){
//         print("Enter a new Strength:")
//         let new:String = readLine()
//         team.strength = new
//       }
//       if(choice == "2"){
//         print("Enter a new Weakness:")
//         let new = readLine()
//         team.weakness = new
//       }
//     }
//  }
}

func showPlayoffs(teams:[Team]){
if(!(teams[0].name == "Atlanta Hawks")){
var west = 0
var east = 0
var East : [Team] = []
var West : [Team] = []
  for team in teams{
    if(team.conference == "West" && west < 8){
      west = west+1
      West.insert(team, at: 0)
    }
  if(team.conference == "East" && east < 8){
      east = east+1
      East.insert(team, at: 0)
    }
  }
  print()
  print("       Eastern Conference Round 1       ")
  print("(1)",East[7].name, "vs.", "(8)",East[0].name)
  print("(2)",East[6].name, "vs.", "(7)",East[1].name)
  print("(3)",East[5].name, "vs.", "(6)",East[2].name)
  print("(4)",East[4].name, "vs.", "(5)",East[3].name)
  print()
    print("       Western Conference Round 1      ")
 print("(1)",West[7].name, "vs.", "(8)",West[0].name)
  print("(2)",West[6].name, "vs.", "(7)",West[1].name)
  print("(3)",West[5].name, "vs.", "(6)",West[2].name)
  print("(4)",West[4].name, "vs.", "(5)",West[3].name)
  print()
}
else{
  print("The season hasn't happened yet.")
}
}

func simulatePlayoffs(teams:[Team])->Team?{
  if(!(teams[0].name == "Atlanta Hawks")){
var west = 0
var east = 0
var East : [Team] = []
var West : [Team] = []
  for team in teams{
    if(team.conference == "West" && west < 8){
      west = west+1
      West.insert(team, at: 0)
    }
  if(team.conference == "East" && east < 8){
      east = east+1
      East.insert(team, at: 0)
    }
  }
  var EastSemis: [Team] = []
  var WestSemis: [Team] = []
 
  EastSemis.insert(simulateP(team1:East[7], team2:East[0]), at: 0)
  EastSemis.insert(simulateP(team1:East[6], team2:East[1]), at: 0)
  EastSemis.insert(simulateP(team1:East[5], team2:East[2]), at: 0)
  EastSemis.insert(simulateP(team1:East[4], team2:East[3]), at: 0)

  WestSemis.insert(simulateP(team1:West[7], team2:West[0]), at: 0)
  WestSemis.insert(simulateP(team1:West[6], team2:West[1]), at: 0)
  WestSemis.insert(simulateP(team1:West[5], team2:West[2]), at: 0)
  WestSemis.insert(simulateP(team1:West[4], team2:West[3]), at: 0)
  
  print()
  print("       Eastern Conference Semifinals      ")
  print(EastSemis[3].name, "vs.", EastSemis[0].name)
  print(EastSemis[2].name, "vs.", EastSemis[1].name)
  print()
    print("       Western Conference Semifinals      ")
 print(WestSemis[3].name, "vs.", WestSemis[0].name)
  print(WestSemis[2].name, "vs.", WestSemis[1].name)
  print()

  var EastFinals: [Team] = []
  var WestFinals: [Team] = []

  EastFinals.insert(simulateP(team1:EastSemis[3], team2:EastSemis[0]), at: 0)
  EastFinals.insert(simulateP(team1:EastSemis[2], team2:EastSemis[1]), at: 0)

  WestFinals.insert(simulateP(team1:WestSemis[3], team2:WestSemis[0]), at: 0)
  WestFinals.insert(simulateP(team1:WestSemis[2], team2:WestSemis[1]), at: 0)

  print()
  print("       Eastern Conference Finals       ")
  print(EastFinals[1].name, "vs.", EastFinals[0].name)
  print()
    print("       Western Conference Finals      ")
 print(WestFinals[1].name, "vs.", WestFinals[0].name)
  print()

  var Finals: [Team] = []
  Finals.insert(simulateP(team1:EastFinals[1], team2:EastFinals[0]), at: 0)
  Finals.insert(simulateP(team1:WestFinals[1], team2:WestFinals[0]), at: 0)

  print()
   print("               NBA Finals       ")
  print(Finals[1].name, "vs.", Finals[0].name)
  print()
  var winner : Team
  winner = simulateP(team1:Finals[1], team2:Finals[0])
  print("The", winner.name, "are the NBA Champions")
  print()
  reset(NBAteams: teams)
  return winner
}
else{
  print("The season hasn't happened yet.")
}
return nil
}

func reset(NBAteams: [Team]){
  for team in NBAteams{
    team.reset()
  }
}

func showHistory(list:[Team?]){
  print()
  print("NBA CHAMPIONS (In order from most recent to oldest)")
  for team in list{
    print((team!).name)
  }
  print()
}

func menu(){
let Atlanta = Team(myName:"Atlanta Hawks", myRating:74, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East")
   let Boston = Team(myName:"Boston Celtics", myRating:91, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East")
   let Brooklyn = Team(myName:"Brooklyn Nets", myRating:84, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East")
   let Charlotte = Team(myName:"Charlotte Hornets", myRating:76, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let Chicago = Team(myName:"Chicago Bulls", myRating:76, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East")
   let Cleveland = Team(myName:"Cleveland Cavaliers", myRating:75, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let Dallas = Team(myName:"Dallas Mavericks", myRating:90, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West")
   let Denver = Team(myName:"Denver Nuggets", myRating:93, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West")
   let Detroit = Team(myName:"Detroit Pistons", myRating:77, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let GoldenState = Team(myName:"Golden State Warriors", myRating:74, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West")
   let Houston = Team(myName:"Houston Rockets", myRating:93, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let Indiana = Team(myName:"Indiana Pacers", myRating:89, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let LAC = Team(myName:"L.A. Clippers", myRating:93, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let LAL = Team(myName:"L.A. Lakers", myRating:96, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West")
   let Memphis = Team(myName:"Memphis Grizzlies", myRating:83, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let Miami = Team(myName:"Miami Heat", myRating:93, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let Milwaukee = Team(myName:"Milwaukee Bucks", myRating:97, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East")
   let Minnesota = Team(myName:"Minnesota Timberwolves", myRating:80, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let NewOrleans = Team(myName:"New Orleans Pelicans", myRating:84, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let NewYork = Team(myName:"New York Knicks", myRating:75, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East")
   let OklahomaCity = Team(myName:"Oklahoma City Thunder", myRating:86, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West")
   let Orlando = Team(myName:"Orlando Magic", myRating:82, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let Philadelphia = Team(myName:"Philadelphia 76ers", myRating:92, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"East")
   let Phoenix = Team(myName:"Phoenix Suns", myRating:78, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"West")
   let Portland = Team(myName:"Portland Trailblazers", myRating:82, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West")
   let Sacramento = Team(myName:"Sacramento Kings", myRating:78, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West")
   let SanAntonio = Team(myName:"San Antonio Spurs", myRating:82, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"West")
   let Toronto = Team(myName:"Toronto Raptors", myRating:90, myStrength:"Balanced", myWeakness:"Grit and Grind", myConference:"East")
   let Utah = Team(myName:"Utah Jazz", myRating:91, myStrength:"Grit and Grind", myWeakness:"Pace and Space", myConference:"West")
   let Washington = Team(myName:"Washington Wizard", myRating:78, myStrength:"Pace and Space", myWeakness:"Balanced", myConference:"East")    
   
   var NBAteams: [Team] = [Atlanta, Boston, Brooklyn, Charlotte, 
    Chicago, Cleveland, Dallas, Denver, Detroit, GoldenState, Houston, 
    Indiana, LAC, LAL, Memphis, Miami, Milwaukee, Minnesota, NewOrleans, 
    NewYork, OklahomaCity, Orlando, Philadelphia, Phoenix, Portland, Sacramento, 
    SanAntonio, Toronto, Utah, Washington]

 var history: [Team?] = []
var loop = 1
while(loop == 1){
print("What would you like to do?")
print("(1) View team stats")
print("(2) Simulate regular season")
print("(3) View playoff bracket")
print("(4) Simulate playoffs")
print("(5) View league history")
print("(0) Quit")
let choice = readLine()
if(choice == "1"){
  showTeamStats(teams: NBAteams)
}
if(choice == "2"){
  NBAteams = schedule(teams: NBAteams)
}
if(choice == "3"){
  showPlayoffs(teams :NBAteams)
}
if(choice == "4"){
  let winner = simulatePlayoffs(teams :NBAteams)
  history.insert(winner, at: 0)
}
if(choice == "5"){
  showHistory(list: history)
}
if(choice == "0"){
  loop = 0;
}
}
}
menu()
