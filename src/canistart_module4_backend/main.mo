import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
// import canisterB "canister:canisterB";
// import CanisterB "canisterB";

// Inter-Canister Calls
// Canister A (Caller)

actor CanisterA {
  // 1. Inter-canister calls

    stable var targetCanister: Principal = Principal.fromText("b77ix-eeaaa-aaaaa-qaada-cai"); // Replace with actual canister ID

    public shared func setTargetCanister(id: Principal) {
        targetCanister := id;
    };

    public func callOtherCanister(name: Text) : async Text {
        let canisterB = actor(Principal.toText(targetCanister)) : actor { 
            remoteGreet: shared Text -> async Text 
        };
        return await canisterB.remoteGreet(name);
    };

    
    // 2. Stable variables and upgrade patterns
    stable var counter: Nat = 0;

    public shared func incrementCounter() : async Nat {
      counter += 1;
      counter
    };

    public shared query func getCounter() : async Nat {
      counter
    };



    // 3. Principal and caller identificatio
    public shared(msg) func whoami() : async Text{
      "You  are " # Principal.toText(msg.caller)
    };

    public shared(msg) func greet(name: Text) : async Text {
      if (Principal.isAnonymous(msg.caller)) {
        return "Hello, " # name # "! You are anonymous."
      } else {
        return "Hello, " # name # "! Your Principal is "# Principal.toText(msg.caller)

      }
    };
    


   
}
