export const wageCalculator = (
  year: number,
  workDays: string[],
  workLevel?: string
): number => {
  let totalWage = 0;

  workDays.forEach((day) => {
    switch (day) {
      case "mon":
        totalWage += 100;
        break;

      case "tue":
        if (workLevel === "director") {
          totalWage += 110;
        } else if (workLevel === "manager") {
          totalWage += 90;
        } else {
          totalWage += 80;
        }
        break;

      case "wed":
      case "thu":
        totalWage += 70;
        break;

      case "fri":
        if (!workLevel || workLevel === "") {
          totalWage += 120;
        }
        totalWage += 90;
        break;

      case "sat":
      case "sun":
        totalWage += 200;
        break;

      default:
        break;
    }
  });

  const isLeapYear = (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
  if (isLeapYear) totalWage *= 1.2;

  return totalWage;
};
