function add(a, b) {
  return a + b;
}

function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function calculateLeaveBalance(total, used) {
  if (used > total) {
    throw new Error('Used leave exceeds total');
  }
  return total - used;
}

function formatEmployeeName(first, last) {
  return `${last.toUpperCase()}, ${first}`;
}

module.exports = { add, isValidEmail, calculateLeaveBalance, formatEmployeeName };
