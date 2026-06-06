function displayFibonacci(n) {
    let n1 = 0, n2 = 1, next_n;

    console.log(`First ${n} Fibonacci numbers:`);

    for (let i = 1; i <= n; i++) {
        console.log(n1);
        
        next_n = n1 + n2;
        n1 = n2;
        n2 = next_n;
    }
}

displayFibonacci(10);

