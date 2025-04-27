const args = process.argv.slice(2);

if (args.length === 0) {
    console.log("Please provide a number as a command-line argument.");
    process.exit(1);
}

const num = parseInt(args[0]);

if (isNaN(num)) {
    console.log("Please enter a valid number.");
    process.exit(1);
}

// For Loop
console.log(`\nMultiplication Table for ${num} (Using For Loop):\n`);
for (let i = 1; i <= 10; i++) {
    console.log(`${num} x ${i} = ${num * i}`);
}

// While Loop
console.log(`\nMultiplication Table for ${num} (Using While Loop):\n`);
let i = 1;
while (i <= 10) {
    console.log(`${num} x ${i} = ${num * i}`);
    i++;
}

// Do...While Loop
console.log(`\nMultiplication Table for ${num} (Using Do...While Loop):\n`);
let j = 1;
do {
    console.log(`${num} x ${j} = ${num * j}`);
    j++;
} while (j <= 10);
