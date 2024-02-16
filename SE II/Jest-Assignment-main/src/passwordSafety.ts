export const passwordSafety = (password: string): string => {
  if (password.length < 8) return "Password should more than 8 characters";
  if (!/[0-9]/.test(password))
    return "Password should contain at least 1 number";
  if (!/[A-Z]/.test(password))
    return "Password should contain at least 1 uppercase character";
  if (!/[a-z]/.test(password))
    return "Password should contain at least 1 lowercase character";
  if (!/[!@#\$%\^\&*\)\(+=._-]/.test(password))
    return "Password should contain at least 1 special character";

  return "Password is safe (a little bit)";
};
