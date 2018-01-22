{
	function f(a) -> b {
        let x := mload(a)
        b := sload(x)
        let c := 3
        mstore(mul(a, b), mload(x))
        let y := add(a, x)
        sstore(y, 10)
    }
    let r := f(1)
    let t := f(2)
}
// ----
// fullInliner
// {
//     {
//         let r := f(1)
//         let t := f(2)
//     }
//     function f(a) -> b
//     {
//         let x := mload(a)
//         b := sload(x)
//         let c := 3
//         mstore(mul(a, b), mload(x))
//         let y := add(a, x)
//         sstore(y, 10)
//     }
// }
