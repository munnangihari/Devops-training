const { add } = require('../src/utils');

test('add works', () => {
  expect(add(2, 3)).toBe(5);
});
