//
//  main.swift
//  text based adventure
//
//  Created by Robert Calungsod on 8/17/17.
//  Copyright © 2017 Erikson Calungsod. All rights reserved.
//

import Foundation

var output = ""
var place = "beach"
var health = 10
var n = false
var s = false
var e = false
var w = false
var ne = false
var nw = false
var se = false
var sw = false
var goingDirection = "none"
var itemsInEnviroment = ["crowbar","shovel","lighthouseKey","coals","harddrive","multitool"]
var inventory = [String] ()
var num1 = 0
var part = 1


func checkMove() {
    
    switch place{
    case "beach" : s = true ; nw = true
    case "shoreline" : se = true ; n = true
    case "uphillClimb" : w = true ; se = true ; n = true
    case "shipwreck" : nw = true
    case "clearing" : s = true ; e = true ; w = true
    case "trees" : e = true
    if part >= 4 {
        w = true
        }
    case "lighthousePath" : e = true ; w = true
    case "campfire" : e = true
    case "trees" : e = true
    case "lighthouse" : s = true ; ne = true
    case "stash" : sw = true
    case "beacon" : n = true
        
    default :  n = false
     s = false
     e = false
     w = false
     ne = false
     nw = false
     se = false
     sw = false
    }
    
}

func openInventory() {
    
    
    if inventory.count != 0 {
        print("You shuffle through all the things you own.")
        
    while num1 < inventory.count {
        print("\(inventory[num1])")
        num1 += 1
    }
    } else {
        print("You dont carry anything with you.")
    }
    sleep(1)
    
}

func move() {
    
    switch place{
    case "beach" :
        switch goingDirection {
        case "northwest" : place = "uphillClimb"
        case "south" : place = "shoreline"
            
        default: print("You see no way to go that way.")
        }
    case "shoreline" :
        switch goingDirection {
        case "southeast" : place = "shipwreck"
        case "north" : place = "beach"
            
        default: print("You see no way to go that way.")
        }
    case "uphillClimb" :
        switch goingDirection {
        case "southeast" : place = "beach"
        case "west" : place = "trees"
        case "north" : place = "clearing"
            
        default: print("You see no way to go that way.")
        }
    case "shipwreck" :
        switch goingDirection {
        case "northwest" : place = "shoreline"
            
        default: print("You see no way to go that way.")
        }
    case "clearing" :
        switch goingDirection {
        case "west" : place = "campfire"
        case "east" : place = "lighthousePath"
        case "south" : place = "uphillClimb"
            
        default: print("You see no way to go that way.")
        }
    case "trees" :
        switch goingDirection {
        case "east" : place = "uphillClimb"
        case "northwest" : place = "brushPath"
            
        default: print("You see no way to go that way.")
        }
    case "lighthousePath" :
        switch goingDirection {
        case "west" : place = "clearing"
        case "east" :
            if inventory.contains("lighthouseKey"){
            place = "lighthouse"
                print("You use the key to open the gate.")
                if part == 1 {
                    part = 2
                }
            } else {
                print("The gate is locked. There must be a key around here.")
            }
            
        default: print("You see no way to go that way.")
        }
    case "campfire" :
        switch goingDirection {
        case "east" : place = "clearing"
            
        default: print("You see no way to go that way.")
        }
    case "stash" :
        switch goingDirection {
        case "southwest" : place = "lighthouse"
        default: print("You see no way to go that way.")
        }
    case "lighthouse" :
        switch goingDirection {
        case "south" : place = "beacon"
        case "northeast" : place = "stash"
        case "stash" :
        switch goingDirection {
        case "southwest" : place = "lighthouse"
                
        default: print("You see no way to go that way.")
        }
        default: print("You see no way to go that way.")
        }
    default: print("There is something wrong.")
    }
    
}


func input() {
    
    print(">>",terminator:"")
    output = readLine()!
    
    switch output{
        
    case "go north","north","n","go to the north":
        if n == true {
            
            goingDirection = "north"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go south","south","s","go to the south":
        if s == true {
            
            goingDirection = "south"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
            
        }
        
    case "go west","west","w","go to the west":
        if w == true {
            
            goingDirection = "west"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go east","east","e","go to the east":
        if e == true {
            
            goingDirection = "east"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go northwest","northwest","nw","go to the northwest":
        if nw == true {
            
            goingDirection = "northwest"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go northeast","northeast","ne","go to the northeast":
        if ne == true {
            
            goingDirection = "northeast"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go southwest","southwest","sw","go to the southwest":
        if sw == true {
            
            goingDirection = "southwest"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
        
    case "go southeast","southeast","se","go to the southeast":
        if se == true {
            
            goingDirection = "southeast"
            move()
            
        } else {
            
            print("You see no way to go that way.")
            
        }
    case "grab crowbar","take crowbar","get crowbar","get","grab":
        
        if itemsInEnviroment.contains("crowbar") && place == "shipwreck" {
            inventory.append("crowbar")
            itemsInEnviroment.remove(at: itemsInEnviroment.index(of: "crowbar")!)
            
            print("You dive into the water and grab the crowbar from amongst \nthe wreckage.")
            
        }else{
            print("Nothing happens.")
        }
    case "hit box","destroy","dismantle box","use crowbar","break box","open box","bash box":
        
        if itemsInEnviroment.contains("shovel") && place == "clearing" {
            inventory.append("shovel")
            itemsInEnviroment.remove(at: itemsInEnviroment.index(of: "shovel")!)
            
            print("You use your crowbar to bash the box, revealing a \nshovel. You grab it.")
        }else{
            print("Nothing happens.")
        }
        
    case "grab coals","take coals","grab","get coals":
        
        if itemsInEnviroment.contains("coals") && place == "campfire" {
            inventory.append("coals")
            itemsInEnviroment.remove(at: itemsInEnviroment.index(of: "coals")!)
            print("You take the coals and hold on to them.")
            
        } else{
            print("Nothing happens.")
        }
        
    case "dig","use shovel":
        
        if place == "trees" || (place == "campfire" && inventory.contains("coals")) {
            switch place {
                case "trees":
                inventory.append("harddrive")
                itemsInEnviroment.remove(at: itemsInEnviroment.index(of: "harddrive")!)
                print("Digging reveals a hard drive. You take it.")
                case "campfire":
                inventory.append("lighthouseKey")
                itemsInEnviroment.remove(at: itemsInEnviroment.index(of: "lighthouseKey")!)
                print("Digging reveals a key.")
                
            default: print("")
            }
        } else {
            print("digging here does nothing.")
        }
            
     case "inventory","open inventory":
        openInventory()
        
    default: print("Nothing happens.")
        
    }
    
    
    
}

//Functions

// ~~~

//Actual Implementation

while health > 1  {
    
    n = false
    s = false
    e = false
    w = false
    ne = false
    nw = false
    se = false
    sw = false
    
    checkMove()
    
    switch place {
        case "beach": print("You stand on a beach, the shorline to the south. \nHigh cliffs tower above you to the north, unclimable and impassable, but there seems to be a path leading upwards to the northwest. \nFrom where you stand, you see a bright light fading in and out just beyond your line of sight, \nperched above the cliffs.")
        case "shoreline": print("You reach the shoreline, waves lap at your feet - a vast open ocean greets you. \nFurther to the southeast you spot a shipwreck, it seems old, however, some markings look fairly recent. \nBack to the north is the beach.")
        case "uphillClimb": print("You stand on what seems like a poorly maintained path among the cliffs. To the north you can just barly make out a clearing. \nTo the west, trees lay in thick bunches. To the southeast, the beach lies below, and further you \ncan make out the overturned form of a ship.")
    case "shipwreck": print("You are waist deep in the \ncrystal blue water. Here you see the shipwreck. To the northwest lies the shoreline.")
    if  itemsInEnviroment.contains("crowbar") {
        print("There is a crowbar among the boards floating around.")
    }
        case "clearing": print("You are in a large clearing. There is a small put out campfire that lies to the west. To the \neast, a path diverges, winding out of sight, above you see above the treeline a lighthouse barely visable. Back to the south is the path leading \ndown to the beach.")
        if itemsInEnviroment.contains("shovel") {
            print("There is a box here lying on it's side. It's shut tight.")
        }
        if part == 3 {
            print("Something moves among the trees to the southwest. When you look again, it is gone.")
            part = 4
        }
        case "trees":
            if part < 4 {
                print("You go into the thick tree line. \nTo the east is the path to the beach and clearing.")
            } else if part >= 4 {
                print("Here you see the thick brush had been slashed apart, and now there is a narrow path to the northwest. \nTo the east is the path to the beach and clearing.")
            }
        if itemsInEnviroment.contains("harddrive") {
            print("Amongst the trees you find a small pile of dirt, out of place. It looks unlikely you could dig it out without help. ")
        }
        
        case "lighthousePath": print("this path is more paved, and despite a few weeds, looks relativley well kept. To the east you see a towering lighthouse, but surrounding the area is a large chainlink fence. \nThere is a gate. It looks to sturdy to break. To the west is the clearing.")
        if part == 2 {
            print("In your peripheral vision, a shadow of a human darts out of view towards the clearing.")
            part = 3
        }
    case "campfire": print("You approach the fireplace. Around you see \nseveral stains of blood leading into thick brush. To the east is the clearing.")
    if itemsInEnviroment.contains("coals") {
        print("There are coals here.")
    }
    if itemsInEnviroment.contains("lighthouseKey") && inventory.contains("coals") {
        print("Beneath the coals you see a stange lump, too hot to touch with your hands.")
        }
        case "lighthouse": print("Inside the light house you are met with the terrible smell of rot. The walls are rusted over \nand much of the equipment has a fine layer of dust on it. There is a spiral staircase leading up to the beacon along the south side of the building. To the northeast there is a small \nstash of assorted things.")
        case "beacon": print("At the top of the lighthouse you have a clear view of much of where you are. To the south, \na beach and a wrecked shipwreck some yards away from the shoreline. To the east, a cliff falling directly into the ocean. To the west, much of the ground you can see is covered by many \ntrees, however, to the northwest, you can see very clearly a radio tower, along with the tops of some buildings \nto the north. Back to the north is the stairway down to the ground floor.")
        case "stash": print("Most of the stuff you see here is broken, or useless, but there is a multitool here that may be useful. To the \nsouthwest is the rest of the lighthouse.")
        default: print("it seems you've stumbled upon a place of emptiness, \ndevoid of the concepts of time and space. Something went horribly wrong in your attempt to discover the \ntruth of the land you have waken up in. You remain here forever, alone and restless.")
    }
    
    input()
    print("")
    
}


