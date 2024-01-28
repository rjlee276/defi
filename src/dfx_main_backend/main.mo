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
    let temp : Int = currentValue - amount;
    if (temp >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Out of natural number bounds");
    };
  };
};
