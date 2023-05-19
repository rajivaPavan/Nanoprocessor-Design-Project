# 3 Bit Adder

<!-- Logic -->
## Logic
> $P_i = A_i \oplus B_i$
> $G_i = A_i \cdot B_i $

> $S_i = P_i \oplus C_{i}$
> $C_i = G_i + P_i \cdot C_{i-1}$

$C_0 = A_0 \cdot B_0 $

$C_1 = G_1 + P_1 \cdot C_0$

$C_2 = G_2 + P_2 \cdot C_1$

**Will implement this component using an Carry Lookahead adder instead of a RCA.**

**Speed and Propagation Delay**: The CLA is known for its faster carry propagation. It generates "carry-lookahead" signals in advance, allowing for parallel carry computation. This reduces the carry propagation delay compared to the ripple carry method used in RCA. In a processor, speed is crucial, and the CLA's faster carry propagation would help enhance the overall performance.

**Reduced Gate Count**: The CLA can have a higher gate count compared to the RCA, as mentioned earlier. However, in the case of a 3-bit adder, the difference in gate count is relatively small. The 3-bit adder requires only a few logic gates, and the CLA's slightly higher gate count would still be manageable. Moreover, the reduced propagation delay of the CLA offsets the slightly higher gate count.

**Scalability**: Considering that the 3-bit adder is used in a 4-bit nano processor, there might be future considerations for expanding the processor's capabilities. In such a case, the CLA provides better scalability. As the number of bits increases, the CLA's carry-lookahead technique becomes more advantageous, enabling efficient carry propagation and reducing overall latency.

In conclusion, for a 3-bit adder used in a 4-bit nano processor, the Carry-Lookahead Adder (CLA) would be more suitable due to its faster carry propagation, acceptable gate count, and scalability for future expansions.



