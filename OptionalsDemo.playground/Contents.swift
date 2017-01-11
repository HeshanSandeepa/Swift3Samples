//: Playground - noun: a place where people can play

var score: Int?
score = 20

//forced un-wrapping
print(score!)

//better way
if score != nil {
    print(score)
} else  {
    print("score is nil")
}

//OPTIONAL BINDING
//more better way
if let confirmedScore = score {
    print(confirmedScore)
}


