import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

//DBank canister
actor DBank {
  stable var currentValue : Float = 300;

  let id = 321413415232;
  stable var startTime = Time.now();

  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdrawl(amount : Float) {
    let temp : Float = currentValue - amount;
    if (temp >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Out of natural number bounds");
    };
  };

  public func time() {
    Debug.print(debug_show (startTime));
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsed_ns = currentTime - startTime;
    let timeElapsed_S = timeElapsed_ns / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsed_S));
    startTime := currentTime;
  };
};
