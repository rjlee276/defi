import Debug "mo:base/Debug";

//DBank canister
actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 321413415232;

  Debug.print(debug_show (id));

  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawl(amount : Nat) {
    if (currentValue - amount >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    };
  };
};
