void setFeedbacks(){
    String responseData = "0:0\n1:0\n2:0\n3:0\n4:0\n5:0\n6:0\n7:0\n8:0\n9:0";
    if(usingSerial){
        responseData = "";
        while(serial.available()>0){
            responseData += serial.readString();
        }
    }
    


    String valuePairs[] = responseData.split("\n");
    for (String pair : valuePairs){
        if(pair.length()>2){
            switch(int(pair.split(":")[0])){
                case 0:
                    heartbeatI.active = int(pair.split(":")[1]) > 0;
                break;
                case 1:
                    bleedingI.active = int(pair.split(":")[1]) > 0;
                break;	
                case 2:
                    fillingI.active = int(pair.split(":")[1]) > 0;
                break;	
                case 3:
                    waterRunningI.active = int(pair.split(":")[1]) > 0;
                break;	
                case 4:
                    plasmaI.active = int(pair.split(":")[1] )> 0;
                break;	
                case 5:
                    mainValveI.active = int(pair.split(":")[1]) > 0;
                break;	
                case 6:
                    
                break;	
                case 7:
                    linePressureI.fill = valToMPa(int(pair.split(":")[1] ));
                break;	
                case 8:
                    pressureS.fill = valToMPa(int(pair.split(":")[1]) );
                break;	
                case 9:
                    waterLevelI.fill = (int(pair.split(":")[1])/1000);
                break;	
            }
        }
    }
}
//ping : 0
//bleed : 1
//fill : 2
//water : 3
//igniter : 4
//fire : 5
//arm leds 6
//line : 7
//tank : 8
//waterLevel : 9


void sendCommands(){


    if(bleedB.active != bleedB.prevActive){
        if(bleedB.active){
            commandBuffer+="1:900000\n";
        }else{
            commandBuffer+="1:0\n";
        }
    }


    if(fillB.active != fillB.prevActive){
        if(fillB.active){
            commandBuffer+="2:900000\n";
        }else{
            commandBuffer+="2:0\n";
        }
    }   


    if(enableWaterB.active && !enableWaterB.prevActive){
        if(enableWaterB.active){
            commandBuffer+="3:900000\n";
        }
    }
    if(disableWaterB.active && !disableWaterB.prevActive){
        if(disableWaterB.active){
            commandBuffer+="3:0\n";
        }
    }    


    if(plasmaTestB.active != plasmaTestB.prevActive){
        if(plasmaTestB.active && armed){
            commandBuffer+="4:"+str(int(plasmaDurationS.value*plasmaDurationS.range*1000))+"\n";
        }else{
            commandBuffer+="4:0\n";
        }
    }   



    if(openB.active && !openB.prevActive){
        if(openB.active && armed){
            commandBuffer+="5:900000\n";
        }
    }
    if(closeB.active && !closeB.prevActive){
        if(closeB.active){
            commandBuffer+="5:0\n";
        }
    } 



    if(armB.active && !armB.prevActive){
        if(armB.active){
            commandBuffer+="6:90000000\n";
            armed = true;
        }
    }
    if(disarmB.active && !disarmB.prevActive){
        if(disarmB.active){
            commandBuffer+="6:0\n";
            armed = false;
        }
    } 

    

    if(resetWaterB.active && !resetWaterB.prevActive){
        if(resetWaterB.active){
            commandBuffer+="7:0\n";
        }
    }

    if(millis()%1000 > 500 && !heartbeat){
        heartbeat = true;
        commandBuffer+="0:1\n";
    }
    if(millis()%1000 < 500 && heartbeat){
        heartbeat = false;
        commandBuffer+="0:0\n";
    }

    firingSequence();
    adjustSequence();

    print(commandBuffer);
    if(usingSerial){
        serial.write(commandBuffer);
    }
    commandBuffer = "";
}

//channel list
//ping : 0
//bleed : 1
//fill : 2
//water : 3
//igniter : 4
//fire : 5
//arm leds 6
//reset water : 7
//panMotor : 8
//tiltMotor : 9