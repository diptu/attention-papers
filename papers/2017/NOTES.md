Recurrent Neural Networks (RNNs) process sequences token-by-token, calculating hidden states `h<sub>t</sub>` as a function of `h<sub>t-1</sub>` and input `t`. This inherent sequential dependency prevents parallelization during training, creating a bottleneck for long sequences where memory constraints hinder batching[1].


Attention mechanisms decouple dependency modeling from sequence distance. By enabling direct interaction between any two positions, they overcome the limitations of recurrent architectures, facilitating effective capture of long-range dependencies in sequence transduction tasks[2].

## References

[1] Vaswani et al.  
**Attention Is All You Need**.  
NeurIPS, 2017.


[1] Bahdanau et al.  
**Neural machine translation by jointly learning to align and translate**
ICLR 2015