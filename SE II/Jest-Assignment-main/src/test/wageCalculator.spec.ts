import { wageCalculator } from "../wageCalculator";

describe("wageCalculator", () => {
  it("Case 1: Not a leap year, mon, wed, no work level", () => {
    expect(wageCalculator(2023, ["mon", "wed"])).toStrictEqual(170);
  });

  //...
  it("Case 2: director, all day with not day in Leap year", () => {
    expect(wageCalculator(2020, ["sun", "mon", "tue", "wed", "thu", "fri", "sat", "eiei"], "director")).toStrictEqual(640);
  });

  it("Case 3: null, tue, fri not in Leap year", () => {
    expect(wageCalculator(2023, ["tue","fri"])).toStrictEqual(200);
  });

  it("Case 4: manager, tue not in Leap year", () => {
    expect(wageCalculator(2023, ["tue"], "manager")).toStrictEqual(90);
  });

});
