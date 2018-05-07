import Foundation

//Hint funktion (ligger globalt). Ligger standard som false. Bliver ændret til true hvis hint bliver givet
var hintDeliveret = false



//Peger hen på spørgsmålene, så man ikke skal skrive alle spørgsmålene fra bunden hver gang
struct Question {
    var question:String
    var answsers:[String]
    var correctAnswerId:String
    var score:Int
    var gameHint:String
    var isCheckpoint:Bool
    
    //sætter variablerne i en ny instans af dette objekt, med følgende parametre
    init(question: String, answsers: [String], correctAnswerId:String, score:Int, gameHint:String, isCheckpoint:Bool = false) {
        self.question = question
        self.answsers = answsers
        self.correctAnswerId = correctAnswerId
        self.score = score
        self.gameHint = gameHint
        self.isCheckpoint = isCheckpoint
    }
    
    //Hvis man bruger et hint bliver hintDeliveret = true. Hvis man allerede har brugt et hint printer den "du har ikke flere hints"
    func deliverHint() {
        if hintDeliveret {
            print("Du har ikke flere hints!")
        }
        else {
            print(gameHint)
            hintDeliveret = true
            print("du har brugt dit sidste hint")
        }
    }
}





//En liste med alle spørgsmålene
let question1 = Question(question: "Spørgsmål 1: Hvad er mercantec?", answsers: ["en uddannelsesinstution" , "et helvede" , "et paradis" , "en børnehave"], correctAnswerId: "1", score: 1000, gameHint: "HINT! Mercantec har en masse uddannelser")

let question2 = Question(question: "Spørgsmål 2: Hvem er den bedste lærer?", answsers:[ "Per" , "Mads" , "Jakup" , "Carsten"], correctAnswerId: "2", score: 50000, gameHint: "HINT! Han bærer en nice cap", isCheckpoint: true)

let question3 = Question(question: "Spørgsmål 3: Hvad er Mads' yndlingstal?", answsers: ["3", "6", "12", "144"], correctAnswerId: "4", score: 100000, gameHint: "HINT! Tallet er 3-cifret")

let question4 = Question(question: "Spørgsmål 4: x fucking d Hvorfor er det hans yndlingstal?", answsers: ["Fordi han har læst 144 Yugioh bøger", "fordi han har set Star Wars 144 gange", "Han siger 'with great power comes geat responsebillity' 144 gange dagligt", "Fordi 12^2=144"], correctAnswerId: "4", score: 250000, gameHint: "HINT! Mads er logisk tænkene")

let question5 = Question(question: "Spørgsmål 5: Hvad er Mads' catchphrase?", answsers: ["Nu skal i lige holde tungen lige i munden" , "Nu skal i lige holde hovedet lige i munden" , "swiggity swooty i'm coming for that booty" , "Jeg hader mit job"], correctAnswerId: "2", score: 1000000, gameHint: "Mads opfinder tit sine egene ordsprog")


//Et array med alle spørgsmål
let questions = [question1, question2, question3, question4, question5]




//Start besked
print("5 spørgsmål fra at vinde en billion!")

print("Du har 1 hint men du behøver ingen for dusØDOÆFØASÆDKLMFAØDKSMF er retadet og har brug for en hagesmæk")
print("Du har sikret dig 50000 hvis du svarer rigtigt på 2. spørgsmål")
print("Du har 1 hint men du behøver ingen for du er retadet og har brug for en hagesmæk")
print("Du har sikret dig 6969696969420420420 og en sutter af mig ude på toilettet, hvis du svarer rigtigt på 2. spørgsmål")
print("Tryk på 's' for at starte spillet og slikke Hans Pilgaard's nosser!")


//Hvis 's' er indtastatet start spillet
var functionChoice = readLine()
while functionChoice == "s" {
    
    //For looper ovenstående array igennem. Her bliver spørgsmålene stillet
    var hasWon = true
    var totalScore = 0
    for question in questions {
        
        //Breaker ud af loop'et hvis man svarer forkert
        if (hasWon) {
            //Mens answeredQuestion ikke er besvaret
            var answeredQuestion = false
            while !answeredQuestion {
                //Printer det nye spørgsmål
                print(question.question)
                
            
                //Laver en count på svarmulighederne og pludser med 1, da man ellers ville starte på 0
                for i in 0..<question.answsers.count {
                    print("\(i + 1): \(question.answsers[i])")
                }
                
                //'?' vender booleanen rundt og ':' betyder ellers. så spørgsmålet lyder således "hvis hintDeliveret er true, skal den printe en tom streng ellers skal den printe "eller tryk på h for hint"
                print("skriv dit svar her\(hintDeliveret ? ":" : " eller tryk h for hint:")")
                let userAnswer = readLine()
                
                //Hvis følgene tegn ikke bliver brugt printer den 'Ugyldigt input'
                if userAnswer == "h" || userAnswer == "1" || userAnswer == "2" || userAnswer == "3" || userAnswer == "4" || userAnswer == "s" {
                    
                    //Hvis man trykker på 'h', print hintet
                    if userAnswer == "h" {
                        question.deliverHint();
                    }
                        //Hvis brugerens svar er det samme som variablen correctAnswerId, print det er korrekt ellers det er ikke korrekt
                    else if userAnswer == question.correctAnswerId { //executer hvis true
                        print("Det er korrekt!")
                        print("Du har vundet \(question.score)")
                        answeredQuestion = true //hvis det er korrekt bliver answeredQuestion = true
                        
                        //Printer gevinsten hvis man har passeret checkpoint
                        if question.isCheckpoint {
                            totalScore = question.score
                        }
                    } else {
                        print("Det var forkert, tryk 's' for at begynde og at S U C C!")
                        if totalScore > 0 { print("Men du har vundet \(totalScore) kr") } //printes hvis man har passeret checkpoint
                        hasWon = false //hvis hasWon = false break
                        break //breaker ud af loop'et
                    }
                } else {
                    print("Ugyldigt input")
                }
            }
        }
    }
    
    //Når den har loopet alle spørgsmål igennem arrayet
    if hasWon {
        print("TILLYKKE DU ER NU MILLIONÆR!")
    }
    
    //Begynd igen
    print("Tryk på 's' for at begynde igen");
    functionChoice = readLine() ?? ""; //hvis readLine er nil, bliver funktionchoice blank
}

