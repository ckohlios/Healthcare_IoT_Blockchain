pragma solidity ^0.4.0;

contract HeartRateMonitor {
    

    function analyze(uint bpm, uint min, uint max) public constant returns (uint){
        uint x=5;
        if(bpm < min||bpm > max){
            if(bpm < min-20||bpm > max+20){
                x=2;
                return (x);
            }
            x=1;
            return (x);
        }
        else{
            x=0;
            return (x);
        }
    }
}

contract GlucoseMonitor {
    

    function analyze(uint glucoseLevel, uint low, uint high) public constant returns (uint){
        uint x=5;
        if(glucoseLevel < low||glucoseLevel > high){
            if(glucoseLevel < low-20||glucoseLevel > high+80){
                if(glucoseLevel > high+140){
                    x=3;
                    return (x);
                }
                x=2;
                return (x);
            }
            x=1;
            return (x);
        }
        else{
            x=0;
            return (x);
        }
    }
}

contract HealthContractCaller{
    
    function heartRateMonitor(uint bpm, uint min, uint max)public constant returns (uint code){
    
        HeartRateMonitor hrm = new HeartRateMonitor();
        
        return hrm.analyze(bpm, min, max);
    }
    
    function glucoseMonitor(uint glucoseLevel, uint low, uint high)public constant returns (uint code){
    
        GlucoseMonitor gm = new GlucoseMonitor();
        
        return gm.analyze(glucoseLevel, low, high);
    }
    
}
