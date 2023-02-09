# htlc8

HTLC = hash time-lock contract    
8 hours from now, thing happens or not    
A yes it does   
B no it don't  

does not need money or btc yet    
focus now on simplest logic and text ui   
maybe    

NAME THING ON FIRST LINE   
8 hrs from now say what it does, like define a time in future when   
A thing happens or    
B not   

^ so in 4 lines we get    
NAME to find thing    
WHAT it does by WHEN (8 hr default constant for now)   
A print this or do thing 'a' if thing happens by when    
B print or do thing 'b' if not    

or anything similar, text only is best  
so player need less ui and make options easy   
and play w 8 hour loop    

https://t.me/rust_in_bitcoin miniscript maybe but we prolly don't need money yet   

ui:      
1 input offer // get player input prolly on paste   
2 find offer // on input '.oo' list oo things
3 format offer // time, options, name, description on one line for now      
4 select option // make options clickable    
a if player selects write to timechain // switch bet easy, apply latest bet       
5 write timechain result on expiry // tell player this game is over        

![htlc8a img](https://i.imgur.com/Q9PZlWk.png)
