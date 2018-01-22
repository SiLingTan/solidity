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
}
// ----
// fullInliner
// {
//     {
//         let f_a := 1
//         let f_b
//         let f_x := mload(f_a)
//         f_b := sload(f_x)
//         let f_c := 3
//         mstore(mul(f_a, f_b), mload(f_x))
//         let f_y := add(f_a, f_x)
//         sstore(f_y, 10)
//         let r := f_b
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
