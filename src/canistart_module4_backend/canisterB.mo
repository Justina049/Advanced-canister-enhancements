// CanisterB (Callee)

actor CanisterB {
    public shared func remoteGreet(name: Text) : async Text {
        return "Hello, " # name # "! Greetings from CanisterB.";
    }
}

