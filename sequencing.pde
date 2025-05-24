void firingSequence(){
    if(fireButtonB.active && !fireButtonB.prevActive){
        firingSequenceStart = millis();
        sequenceStep = 0;
    }
    int plasmaDur = int(plasmaDurationS.value*plasmaDurationS.range*1000.0);
    int plasmaDel = int(plasmaDelayS.value*plasmaDelayS.range*1000.0);
    int valveTime = int(openTimeS.value*openTimeS.range*1000.0);
    int sequenceDuration = autoFire?plasmaDel+plasmaDur+valveTime:valveTime;
    int sequenceTime = millis()-firingSequenceStart;
    if(sequenceTime < sequenceDuration){
        if(autoFire){
            if(sequenceTime <= plasmaDur && sequenceStep <= 0){
                commandBuffer+="4:"+str(plasmaDur)+"\n";
                sequenceStep = 1;
            }
        }
        if(sequenceTime >= sequenceDuration-valveTime && sequenceStep <= 1){
                commandBuffer+="5:"+str(valveTime)+"\n";
                sequenceStep=2;
        }
    }
}

void adjustSequence(){
    float pressureTank = pressureS.fill*pressureS.range;
    float pressureTarget = pressureS.setpoint*pressureS.range;
    float pressureLine = linePressureI.fill*linePressureI.range;
    if(adjustB.active && !adjustB.prevActive){
        adjusting = true;
        directionUp = pressureTarget>pressureTank;
    }
    if(stopB.active && !stopB.prevActive){
        adjusting = false;
    }
    if (adjusting){
        if(directionUp){
            if(pressureTank<pressureTarget){
                commandBuffer+="1:100\n";
            }else{
                adjusting=false;
            }
        }else{
            if(pressureTank>pressureTarget){
                commandBuffer+="2:100\n";
            }else{
                adjusting=false;
            }
        }
    }
}