import Principal "mo:base/Principal";

// Inter-Canister Calls
// Canister A (Caller)

actor CanisterA {
    stable var targetCanister: Principal = Principal.fromText("aaaaa-aa"); // Replace with actual canister ID

    public func setTargetCanister(id: Principal) {
        targetCanister := id;
    };

    public shared func callOtherCanister(name: Text) : async Text {
        let canisterB = actor(Principal.toText(targetCanister)) : actor { remoteGreet: shared Text -> async Text };
        await canisterB.remoteGreet(name);
    }
}
