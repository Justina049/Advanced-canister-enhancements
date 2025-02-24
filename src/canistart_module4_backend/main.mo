import Principal "mo:base/Principal";
import Nat "mo:base/Nat";

// Inter-Canister Calls
// Canister A (Caller)

actor CanisterA {
  // 1. Inter-canister calls

    stable var targetCanister: Principal = Principal.fromText("aaaaa-aa"); // Replace with actual canister ID

    public func setTargetCanister(id: Principal) {
        targetCanister := id;
    };

    public shared func callOtherCanister(name: Text) : async Text {
        let canisterB = actor(Principal.toText(targetCanister)) : actor { remoteGreet: shared Text -> async Text };
        await canisterB.remoteGreet(name);
    };


    stable var counter: Nat = 0;

    public func incrementCounter() : async Nat {
      counter += 1;
      counter
    };

    public query func getCiounter() : async Nat {
      counter
    };
    

    

    
   
}
