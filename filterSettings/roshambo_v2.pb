ик	
≤ш
B
AssignVariableOp
resource
value"dtype"
dtypetypeИ
Љ
AvgPool

value"T
output"T"
ksize	list(int)(0"
strides	list(int)(0""
paddingstring:
SAMEVALID"-
data_formatstringNHWC:
NHWCNCHW"
Ttype:
2
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
Ы
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(И

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
9
Softmax
logits"T
softmax"T"
Ttype:
2
Њ
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring И
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.5.0-dev202011082v1.12.1-45362-gec957ef3768Ўк
~
layer1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namelayer1/kernel
w
!layer1/kernel/Read/ReadVariableOpReadVariableOplayer1/kernel*&
_output_shapes
:*
dtype0
n
layer1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namelayer1/bias
g
layer1/bias/Read/ReadVariableOpReadVariableOplayer1/bias*
_output_shapes
:*
dtype0
~
layer2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelayer2/kernel
w
!layer2/kernel/Read/ReadVariableOpReadVariableOplayer2/kernel*&
_output_shapes
: *
dtype0
n
layer2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelayer2/bias
g
layer2/bias/Read/ReadVariableOpReadVariableOplayer2/bias*
_output_shapes
: *
dtype0
~
layer3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: @*
shared_namelayer3/kernel
w
!layer3/kernel/Read/ReadVariableOpReadVariableOplayer3/kernel*&
_output_shapes
: @*
dtype0
n
layer3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namelayer3/bias
g
layer3/bias/Read/ReadVariableOpReadVariableOplayer3/bias*
_output_shapes
:@*
dtype0

layer4/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@А*
shared_namelayer4/kernel
x
!layer4/kernel/Read/ReadVariableOpReadVariableOplayer4/kernel*'
_output_shapes
:@А*
dtype0
o
layer4/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*
shared_namelayer4/bias
h
layer4/bias/Read/ReadVariableOpReadVariableOplayer4/bias*
_output_shapes	
:А*
dtype0
А
layer5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:АА*
shared_namelayer5/kernel
y
!layer5/kernel/Read/ReadVariableOpReadVariableOplayer5/kernel*(
_output_shapes
:АА*
dtype0
o
layer5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:А*
shared_namelayer5/bias
h
layer5/bias/Read/ReadVariableOpReadVariableOplayer5/bias*
_output_shapes	
:А*
dtype0
w
layer6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	А*
shared_namelayer6/kernel
p
!layer6/kernel/Read/ReadVariableOpReadVariableOplayer6/kernel*
_output_shapes
:	А*
dtype0
n
layer6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namelayer6/bias
g
layer6/bias/Read/ReadVariableOpReadVariableOplayer6/bias*
_output_shapes
:*
dtype0

NoOpNoOp
ђ,
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*з+
valueЁ+BЏ+ B”+
™
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer-4
layer_with_weights-2
layer-5
layer-6
layer_with_weights-3
layer-7
	layer-8

layer_with_weights-4

layer-9
layer-10
layer-11
layer_with_weights-5
layer-12
trainable_variables
regularization_losses
	variables
	keras_api

signatures
 
h

kernel
bias
trainable_variables
regularization_losses
	variables
	keras_api
R
trainable_variables
regularization_losses
	variables
	keras_api
h

kernel
bias
trainable_variables
 regularization_losses
!	variables
"	keras_api
R
#trainable_variables
$regularization_losses
%	variables
&	keras_api
h

'kernel
(bias
)trainable_variables
*regularization_losses
+	variables
,	keras_api
R
-trainable_variables
.regularization_losses
/	variables
0	keras_api
h

1kernel
2bias
3trainable_variables
4regularization_losses
5	variables
6	keras_api
R
7trainable_variables
8regularization_losses
9	variables
:	keras_api
h

;kernel
<bias
=trainable_variables
>regularization_losses
?	variables
@	keras_api
R
Atrainable_variables
Bregularization_losses
C	variables
D	keras_api
R
Etrainable_variables
Fregularization_losses
G	variables
H	keras_api
h

Ikernel
Jbias
Ktrainable_variables
Lregularization_losses
M	variables
N	keras_api
V
0
1
2
3
'4
(5
16
27
;8
<9
I10
J11
 
V
0
1
2
3
'4
(5
16
27
;8
<9
I10
J11
≠
trainable_variables
Ometrics

Players
regularization_losses
	variables
Qnon_trainable_variables
Rlayer_metrics
Slayer_regularization_losses
 
YW
VARIABLE_VALUElayer1/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer1/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
≠
trainable_variables
Tmetrics

Ulayers
regularization_losses
	variables
Vnon_trainable_variables
Wlayer_metrics
Xlayer_regularization_losses
 
 
 
≠
trainable_variables
Ymetrics

Zlayers
regularization_losses
	variables
[non_trainable_variables
\layer_metrics
]layer_regularization_losses
YW
VARIABLE_VALUElayer2/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer2/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
≠
trainable_variables
^metrics

_layers
 regularization_losses
!	variables
`non_trainable_variables
alayer_metrics
blayer_regularization_losses
 
 
 
≠
#trainable_variables
cmetrics

dlayers
$regularization_losses
%	variables
enon_trainable_variables
flayer_metrics
glayer_regularization_losses
YW
VARIABLE_VALUElayer3/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer3/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

'0
(1
 

'0
(1
≠
)trainable_variables
hmetrics

ilayers
*regularization_losses
+	variables
jnon_trainable_variables
klayer_metrics
llayer_regularization_losses
 
 
 
≠
-trainable_variables
mmetrics

nlayers
.regularization_losses
/	variables
onon_trainable_variables
player_metrics
qlayer_regularization_losses
YW
VARIABLE_VALUElayer4/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer4/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

10
21
 

10
21
≠
3trainable_variables
rmetrics

slayers
4regularization_losses
5	variables
tnon_trainable_variables
ulayer_metrics
vlayer_regularization_losses
 
 
 
≠
7trainable_variables
wmetrics

xlayers
8regularization_losses
9	variables
ynon_trainable_variables
zlayer_metrics
{layer_regularization_losses
YW
VARIABLE_VALUElayer5/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer5/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

;0
<1
 

;0
<1
Ѓ
=trainable_variables
|metrics

}layers
>regularization_losses
?	variables
~non_trainable_variables
layer_metrics
 Аlayer_regularization_losses
 
 
 
≤
Atrainable_variables
Бmetrics
Вlayers
Bregularization_losses
C	variables
Гnon_trainable_variables
Дlayer_metrics
 Еlayer_regularization_losses
 
 
 
≤
Etrainable_variables
Жmetrics
Зlayers
Fregularization_losses
G	variables
Иnon_trainable_variables
Йlayer_metrics
 Кlayer_regularization_losses
YW
VARIABLE_VALUElayer6/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer6/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE

I0
J1
 

I0
J1
≤
Ktrainable_variables
Лmetrics
Мlayers
Lregularization_losses
M	variables
Нnon_trainable_variables
Оlayer_metrics
 Пlayer_regularization_losses
 
^
0
1
2
3
4
5
6
7
	8

9
10
11
12
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
К
serving_default_input_1Placeholder*/
_output_shapes
:€€€€€€€€€@@*
dtype0*$
shape:€€€€€€€€€@@
т
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1layer1/kernellayer1/biaslayer2/kernellayer2/biaslayer3/kernellayer3/biaslayer4/kernellayer4/biaslayer5/kernellayer5/biaslayer6/kernellayer6/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В **
f%R#
!__inference_signature_wrapper_761
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ј
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename!layer1/kernel/Read/ReadVariableOplayer1/bias/Read/ReadVariableOp!layer2/kernel/Read/ReadVariableOplayer2/bias/Read/ReadVariableOp!layer3/kernel/Read/ReadVariableOplayer3/bias/Read/ReadVariableOp!layer4/kernel/Read/ReadVariableOplayer4/bias/Read/ReadVariableOp!layer5/kernel/Read/ReadVariableOplayer5/bias/Read/ReadVariableOp!layer6/kernel/Read/ReadVariableOplayer6/bias/Read/ReadVariableOpConst*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *&
f!R
__inference__traced_save_1165
Ћ
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamelayer1/kernellayer1/biaslayer2/kernellayer2/biaslayer3/kernellayer3/biaslayer4/kernellayer4/biaslayer5/kernellayer5/biaslayer6/kernellayer6/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *)
f$R"
 __inference__traced_restore_1211√Щ
Ґ
B
&__inference_flatten_layer_call_fn_1086

inputs
identity¬
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_flatten_layer_call_and_return_conditional_losses_5152
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
С
[
?__inference_pool3_layer_call_and_return_conditional_losses_1010

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€@*
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
ї
]
A__inference_flatten_layer_call_and_return_conditional_losses_1081

inputs
identity_
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€А   2
Consth
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2	
Reshapee
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ѓ
@
$__inference_pool4_layer_call_fn_1045

inputs
identity»
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool4_layer_call_and_return_conditional_losses_4612
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Х
[
?__inference_pool5_layer_call_and_return_conditional_losses_1070

inputs
identityЬ
AvgPoolAvgPoolinputs*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2	
AvgPoolm
IdentityIdentityAvgPool:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
 

Ў
?__inference_layer1_layer_call_and_return_conditional_losses_936

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<*
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€<<2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
–

Ў
?__inference_layer4_layer_call_and_return_conditional_losses_440

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpЦ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@А*
dtype02
Conv2D/ReadVariableOp•
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
Conv2DН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЙ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2	
BiasAdda
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
Relu†
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Х
[
?__inference_pool4_layer_call_and_return_conditional_losses_1040

inputs
identityЬ
AvgPoolAvgPoolinputs*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2	
AvgPoolm
IdentityIdentityAvgPool:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
ѓ	
У
&__inference_roshambo_layer_call_fn_730
input_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10
identityИҐStatefulPartitionedCallш
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *J
fERC
A__inference_roshambo_layer_call_and_return_conditional_losses_7032
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
ђ	
Т
&__inference_roshambo_layer_call_fn_896

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10
identityИҐStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *J
fERC
A__inference_roshambo_layer_call_and_return_conditional_losses_6342
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
 

Ў
?__inference_layer3_layer_call_and_return_conditional_losses_400

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€ ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
Р
Z
>__inference_pool1_layer_call_and_return_conditional_losses_950

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€*
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€<<:W S
/
_output_shapes
:€€€€€€€€€<<
 
_user_specified_nameinputs
ш
z
%__inference_layer4_layer_call_fn_1035

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer4_layer_call_and_return_conditional_losses_4402
StatefulPartitionedCallЧ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
х4
€
 __inference__traced_restore_1211
file_prefix"
assignvariableop_layer1_kernel"
assignvariableop_1_layer1_bias$
 assignvariableop_2_layer2_kernel"
assignvariableop_3_layer2_bias$
 assignvariableop_4_layer3_kernel"
assignvariableop_5_layer3_bias$
 assignvariableop_6_layer4_kernel"
assignvariableop_7_layer4_bias$
 assignvariableop_8_layer5_kernel"
assignvariableop_9_layer5_bias%
!assignvariableop_10_layer6_kernel#
assignvariableop_11_layer6_bias
identity_13ИҐAssignVariableOpҐAssignVariableOp_1ҐAssignVariableOp_10ҐAssignVariableOp_11ҐAssignVariableOp_2ҐAssignVariableOp_3ҐAssignVariableOp_4ҐAssignVariableOp_5ҐAssignVariableOp_6ҐAssignVariableOp_7ҐAssignVariableOp_8ҐAssignVariableOp_9ї
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*«
valueљBЇB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names®
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B 2
RestoreV2/shape_and_slicesм
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*H
_output_shapes6
4:::::::::::::*
dtypes
22
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

IdentityЭ
AssignVariableOpAssignVariableOpassignvariableop_layer1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1£
AssignVariableOp_1AssignVariableOpassignvariableop_1_layer1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2•
AssignVariableOp_2AssignVariableOp assignvariableop_2_layer2_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3£
AssignVariableOp_3AssignVariableOpassignvariableop_3_layer2_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4•
AssignVariableOp_4AssignVariableOp assignvariableop_4_layer3_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5£
AssignVariableOp_5AssignVariableOpassignvariableop_5_layer3_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6•
AssignVariableOp_6AssignVariableOp assignvariableop_6_layer4_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7£
AssignVariableOp_7AssignVariableOpassignvariableop_7_layer4_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8•
AssignVariableOp_8AssignVariableOp assignvariableop_8_layer5_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9£
AssignVariableOp_9AssignVariableOpassignvariableop_9_layer5_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10©
AssignVariableOp_10AssignVariableOp!assignvariableop_10_layer6_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11І
AssignVariableOp_11AssignVariableOpassignvariableop_11_layer6_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_119
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOpж
Identity_12Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_12ў
Identity_13IdentityIdentity_12:output:0^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
T0*
_output_shapes
: 2
Identity_13"#
identity_13Identity_13:output:0*E
_input_shapes4
2: ::::::::::::2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
§0
з
A__inference_roshambo_layer_call_and_return_conditional_losses_591
input_1

layer1_554

layer1_556

layer2_560

layer2_562

layer3_566

layer3_568

layer4_572

layer4_574

layer5_578

layer5_580

layer6_585

layer6_587
identityИҐlayer1/StatefulPartitionedCallҐlayer2/StatefulPartitionedCallҐlayer3/StatefulPartitionedCallҐlayer4/StatefulPartitionedCallҐlayer5/StatefulPartitionedCallҐlayer6/StatefulPartitionedCallН
layer1/StatefulPartitionedCallStatefulPartitionedCallinput_1
layer1_554
layer1_556*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer1_layer_call_and_return_conditional_losses_3202 
layer1/StatefulPartitionedCallф
pool1/PartitionedCallPartitionedCall'layer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool1_layer_call_and_return_conditional_losses_3412
pool1/PartitionedCall§
layer2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0
layer2_560
layer2_562*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer2_layer_call_and_return_conditional_losses_3602 
layer2/StatefulPartitionedCallф
pool2/PartitionedCallPartitionedCall'layer2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool2_layer_call_and_return_conditional_losses_3812
pool2/PartitionedCall§
layer3/StatefulPartitionedCallStatefulPartitionedCallpool2/PartitionedCall:output:0
layer3_566
layer3_568*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer3_layer_call_and_return_conditional_losses_4002 
layer3/StatefulPartitionedCallф
pool3/PartitionedCallPartitionedCall'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool3_layer_call_and_return_conditional_losses_4212
pool3/PartitionedCall•
layer4/StatefulPartitionedCallStatefulPartitionedCallpool3/PartitionedCall:output:0
layer4_572
layer4_574*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer4_layer_call_and_return_conditional_losses_4402 
layer4/StatefulPartitionedCallх
pool4/PartitionedCallPartitionedCall'layer4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool4_layer_call_and_return_conditional_losses_4612
pool4/PartitionedCall•
layer5/StatefulPartitionedCallStatefulPartitionedCallpool4/PartitionedCall:output:0
layer5_578
layer5_580*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer5_layer_call_and_return_conditional_losses_4802 
layer5/StatefulPartitionedCallх
pool5/PartitionedCallPartitionedCall'layer5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool5_layer_call_and_return_conditional_losses_5012
pool5/PartitionedCallк
flatten/PartitionedCallPartitionedCallpool5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_flatten_layer_call_and_return_conditional_losses_5152
flatten/PartitionedCallЮ
layer6/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0
layer6_585
layer6_587*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer6_layer_call_and_return_conditional_losses_5342 
layer6/StatefulPartitionedCallЅ
IdentityIdentity'layer6/StatefulPartitionedCall:output:0^layer1/StatefulPartitionedCall^layer2/StatefulPartitionedCall^layer3/StatefulPartitionedCall^layer4/StatefulPartitionedCall^layer5/StatefulPartitionedCall^layer6/StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2@
layer4/StatefulPartitionedCalllayer4/StatefulPartitionedCall2@
layer5/StatefulPartitionedCalllayer5/StatefulPartitionedCall2@
layer6/StatefulPartitionedCalllayer6/StatefulPartitionedCall:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
 

Ў
?__inference_layer3_layer_call_and_return_conditional_losses_996

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€ ::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
Р
Z
>__inference_pool1_layer_call_and_return_conditional_losses_341

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€*
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€<<:W S
/
_output_shapes
:€€€€€€€€€<<
 
_user_specified_nameinputs
Р
Z
>__inference_pool3_layer_call_and_return_conditional_losses_421

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€@*
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
 

Ў
?__inference_layer2_layer_call_and_return_conditional_losses_360

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ 2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
ђ	
Т
&__inference_roshambo_layer_call_fn_925

inputs
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10
identityИҐStatefulPartitionedCallч
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *J
fERC
A__inference_roshambo_layer_call_and_return_conditional_losses_7032
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
ф	
Ў
?__inference_layer6_layer_call_and_return_conditional_losses_534

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpО
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€2	
SoftmaxЦ
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
З	
О
!__inference_signature_wrapper_761
input_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10
identityИҐStatefulPartitionedCall’
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *'
f"R 
__inference__wrapped_model_3052
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
Ф
Z
>__inference_pool5_layer_call_and_return_conditional_losses_501

inputs
identityЬ
AvgPoolAvgPoolinputs*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2	
AvgPoolm
IdentityIdentityAvgPool:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
©
?
#__inference_pool2_layer_call_fn_985

inputs
identity«
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool2_layer_call_and_return_conditional_losses_3812
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
фB
д
A__inference_roshambo_layer_call_and_return_conditional_losses_814

inputs)
%layer1_conv2d_readvariableop_resource*
&layer1_biasadd_readvariableop_resource)
%layer2_conv2d_readvariableop_resource*
&layer2_biasadd_readvariableop_resource)
%layer3_conv2d_readvariableop_resource*
&layer3_biasadd_readvariableop_resource)
%layer4_conv2d_readvariableop_resource*
&layer4_biasadd_readvariableop_resource)
%layer5_conv2d_readvariableop_resource*
&layer5_biasadd_readvariableop_resource)
%layer6_matmul_readvariableop_resource*
&layer6_biasadd_readvariableop_resource
identityИҐlayer1/BiasAdd/ReadVariableOpҐlayer1/Conv2D/ReadVariableOpҐlayer2/BiasAdd/ReadVariableOpҐlayer2/Conv2D/ReadVariableOpҐlayer3/BiasAdd/ReadVariableOpҐlayer3/Conv2D/ReadVariableOpҐlayer4/BiasAdd/ReadVariableOpҐlayer4/Conv2D/ReadVariableOpҐlayer5/BiasAdd/ReadVariableOpҐlayer5/Conv2D/ReadVariableOpҐlayer6/BiasAdd/ReadVariableOpҐlayer6/MatMul/ReadVariableOp™
layer1/Conv2D/ReadVariableOpReadVariableOp%layer1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype02
layer1/Conv2D/ReadVariableOpє
layer1/Conv2DConv2Dinputs$layer1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<*
paddingVALID*
strides
2
layer1/Conv2D°
layer1/BiasAdd/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer1/BiasAdd/ReadVariableOp§
layer1/BiasAddBiasAddlayer1/Conv2D:output:0%layer1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
layer1/BiasAddu
layer1/ReluRelulayer1/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
layer1/ReluЇ
pool1/AvgPoolAvgPoollayer1/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
ksize
*
paddingVALID*
strides
2
pool1/AvgPool™
layer2/Conv2D/ReadVariableOpReadVariableOp%layer2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
layer2/Conv2D/ReadVariableOp…
layer2/Conv2DConv2Dpool1/AvgPool:output:0$layer2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingVALID*
strides
2
layer2/Conv2D°
layer2/BiasAdd/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
layer2/BiasAdd/ReadVariableOp§
layer2/BiasAddBiasAddlayer2/Conv2D:output:0%layer2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
layer2/BiasAddu
layer2/ReluRelulayer2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
layer2/ReluЇ
pool2/AvgPoolAvgPoollayer2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
ksize
*
paddingVALID*
strides
2
pool2/AvgPool™
layer3/Conv2D/ReadVariableOpReadVariableOp%layer3_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
layer3/Conv2D/ReadVariableOp…
layer3/Conv2DConv2Dpool2/AvgPool:output:0$layer3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingVALID*
strides
2
layer3/Conv2D°
layer3/BiasAdd/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
layer3/BiasAdd/ReadVariableOp§
layer3/BiasAddBiasAddlayer3/Conv2D:output:0%layer3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@2
layer3/BiasAddu
layer3/ReluRelulayer3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2
layer3/ReluЇ
pool3/AvgPoolAvgPoollayer3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
ksize
*
paddingVALID*
strides
2
pool3/AvgPoolЂ
layer4/Conv2D/ReadVariableOpReadVariableOp%layer4_conv2d_readvariableop_resource*'
_output_shapes
:@А*
dtype02
layer4/Conv2D/ReadVariableOp 
layer4/Conv2DConv2Dpool3/AvgPool:output:0$layer4/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
layer4/Conv2DҐ
layer4/BiasAdd/ReadVariableOpReadVariableOp&layer4_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
layer4/BiasAdd/ReadVariableOp•
layer4/BiasAddBiasAddlayer4/Conv2D:output:0%layer4/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer4/BiasAddv
layer4/ReluRelulayer4/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer4/Reluї
pool4/AvgPoolAvgPoollayer4/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
pool4/AvgPoolђ
layer5/Conv2D/ReadVariableOpReadVariableOp%layer5_conv2d_readvariableop_resource*(
_output_shapes
:АА*
dtype02
layer5/Conv2D/ReadVariableOp 
layer5/Conv2DConv2Dpool4/AvgPool:output:0$layer5/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
layer5/Conv2DҐ
layer5/BiasAdd/ReadVariableOpReadVariableOp&layer5_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
layer5/BiasAdd/ReadVariableOp•
layer5/BiasAddBiasAddlayer5/Conv2D:output:0%layer5/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer5/BiasAddv
layer5/ReluRelulayer5/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer5/Reluї
pool5/AvgPoolAvgPoollayer5/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
pool5/AvgPoolo
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€А   2
flatten/ConstР
flatten/ReshapeReshapepool5/AvgPool:output:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2
flatten/Reshape£
layer6/MatMul/ReadVariableOpReadVariableOp%layer6_matmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
layer6/MatMul/ReadVariableOpЪ
layer6/MatMulMatMulflatten/Reshape:output:0$layer6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/MatMul°
layer6/BiasAdd/ReadVariableOpReadVariableOp&layer6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer6/BiasAdd/ReadVariableOpЭ
layer6/BiasAddBiasAddlayer6/MatMul:product:0%layer6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/BiasAddv
layer6/SoftmaxSoftmaxlayer6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/Softmaxж
IdentityIdentitylayer6/Softmax:softmax:0^layer1/BiasAdd/ReadVariableOp^layer1/Conv2D/ReadVariableOp^layer2/BiasAdd/ReadVariableOp^layer2/Conv2D/ReadVariableOp^layer3/BiasAdd/ReadVariableOp^layer3/Conv2D/ReadVariableOp^layer4/BiasAdd/ReadVariableOp^layer4/Conv2D/ReadVariableOp^layer5/BiasAdd/ReadVariableOp^layer5/Conv2D/ReadVariableOp^layer6/BiasAdd/ReadVariableOp^layer6/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2>
layer1/BiasAdd/ReadVariableOplayer1/BiasAdd/ReadVariableOp2<
layer1/Conv2D/ReadVariableOplayer1/Conv2D/ReadVariableOp2>
layer2/BiasAdd/ReadVariableOplayer2/BiasAdd/ReadVariableOp2<
layer2/Conv2D/ReadVariableOplayer2/Conv2D/ReadVariableOp2>
layer3/BiasAdd/ReadVariableOplayer3/BiasAdd/ReadVariableOp2<
layer3/Conv2D/ReadVariableOplayer3/Conv2D/ReadVariableOp2>
layer4/BiasAdd/ReadVariableOplayer4/BiasAdd/ReadVariableOp2<
layer4/Conv2D/ReadVariableOplayer4/Conv2D/ReadVariableOp2>
layer5/BiasAdd/ReadVariableOplayer5/BiasAdd/ReadVariableOp2<
layer5/Conv2D/ReadVariableOplayer5/Conv2D/ReadVariableOp2>
layer6/BiasAdd/ReadVariableOplayer6/BiasAdd/ReadVariableOp2<
layer6/MatMul/ReadVariableOplayer6/MatMul/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
§0
з
A__inference_roshambo_layer_call_and_return_conditional_losses_551
input_1

layer1_331

layer1_333

layer2_371

layer2_373

layer3_411

layer3_413

layer4_451

layer4_453

layer5_491

layer5_493

layer6_545

layer6_547
identityИҐlayer1/StatefulPartitionedCallҐlayer2/StatefulPartitionedCallҐlayer3/StatefulPartitionedCallҐlayer4/StatefulPartitionedCallҐlayer5/StatefulPartitionedCallҐlayer6/StatefulPartitionedCallН
layer1/StatefulPartitionedCallStatefulPartitionedCallinput_1
layer1_331
layer1_333*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer1_layer_call_and_return_conditional_losses_3202 
layer1/StatefulPartitionedCallф
pool1/PartitionedCallPartitionedCall'layer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool1_layer_call_and_return_conditional_losses_3412
pool1/PartitionedCall§
layer2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0
layer2_371
layer2_373*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer2_layer_call_and_return_conditional_losses_3602 
layer2/StatefulPartitionedCallф
pool2/PartitionedCallPartitionedCall'layer2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool2_layer_call_and_return_conditional_losses_3812
pool2/PartitionedCall§
layer3/StatefulPartitionedCallStatefulPartitionedCallpool2/PartitionedCall:output:0
layer3_411
layer3_413*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer3_layer_call_and_return_conditional_losses_4002 
layer3/StatefulPartitionedCallф
pool3/PartitionedCallPartitionedCall'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool3_layer_call_and_return_conditional_losses_4212
pool3/PartitionedCall•
layer4/StatefulPartitionedCallStatefulPartitionedCallpool3/PartitionedCall:output:0
layer4_451
layer4_453*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer4_layer_call_and_return_conditional_losses_4402 
layer4/StatefulPartitionedCallх
pool4/PartitionedCallPartitionedCall'layer4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool4_layer_call_and_return_conditional_losses_4612
pool4/PartitionedCall•
layer5/StatefulPartitionedCallStatefulPartitionedCallpool4/PartitionedCall:output:0
layer5_491
layer5_493*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer5_layer_call_and_return_conditional_losses_4802 
layer5/StatefulPartitionedCallх
pool5/PartitionedCallPartitionedCall'layer5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool5_layer_call_and_return_conditional_losses_5012
pool5/PartitionedCallк
flatten/PartitionedCallPartitionedCallpool5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_flatten_layer_call_and_return_conditional_losses_5152
flatten/PartitionedCallЮ
layer6/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0
layer6_545
layer6_547*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer6_layer_call_and_return_conditional_losses_5342 
layer6/StatefulPartitionedCallЅ
IdentityIdentity'layer6/StatefulPartitionedCall:output:0^layer1/StatefulPartitionedCall^layer2/StatefulPartitionedCall^layer3/StatefulPartitionedCall^layer4/StatefulPartitionedCall^layer5/StatefulPartitionedCall^layer6/StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2@
layer4/StatefulPartitionedCalllayer4/StatefulPartitionedCall2@
layer5/StatefulPartitionedCalllayer5/StatefulPartitionedCall2@
layer6/StatefulPartitionedCalllayer6/StatefulPartitionedCall:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
фB
д
A__inference_roshambo_layer_call_and_return_conditional_losses_867

inputs)
%layer1_conv2d_readvariableop_resource*
&layer1_biasadd_readvariableop_resource)
%layer2_conv2d_readvariableop_resource*
&layer2_biasadd_readvariableop_resource)
%layer3_conv2d_readvariableop_resource*
&layer3_biasadd_readvariableop_resource)
%layer4_conv2d_readvariableop_resource*
&layer4_biasadd_readvariableop_resource)
%layer5_conv2d_readvariableop_resource*
&layer5_biasadd_readvariableop_resource)
%layer6_matmul_readvariableop_resource*
&layer6_biasadd_readvariableop_resource
identityИҐlayer1/BiasAdd/ReadVariableOpҐlayer1/Conv2D/ReadVariableOpҐlayer2/BiasAdd/ReadVariableOpҐlayer2/Conv2D/ReadVariableOpҐlayer3/BiasAdd/ReadVariableOpҐlayer3/Conv2D/ReadVariableOpҐlayer4/BiasAdd/ReadVariableOpҐlayer4/Conv2D/ReadVariableOpҐlayer5/BiasAdd/ReadVariableOpҐlayer5/Conv2D/ReadVariableOpҐlayer6/BiasAdd/ReadVariableOpҐlayer6/MatMul/ReadVariableOp™
layer1/Conv2D/ReadVariableOpReadVariableOp%layer1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype02
layer1/Conv2D/ReadVariableOpє
layer1/Conv2DConv2Dinputs$layer1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<*
paddingVALID*
strides
2
layer1/Conv2D°
layer1/BiasAdd/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer1/BiasAdd/ReadVariableOp§
layer1/BiasAddBiasAddlayer1/Conv2D:output:0%layer1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
layer1/BiasAddu
layer1/ReluRelulayer1/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
layer1/ReluЇ
pool1/AvgPoolAvgPoollayer1/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
ksize
*
paddingVALID*
strides
2
pool1/AvgPool™
layer2/Conv2D/ReadVariableOpReadVariableOp%layer2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
layer2/Conv2D/ReadVariableOp…
layer2/Conv2DConv2Dpool1/AvgPool:output:0$layer2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingVALID*
strides
2
layer2/Conv2D°
layer2/BiasAdd/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
layer2/BiasAdd/ReadVariableOp§
layer2/BiasAddBiasAddlayer2/Conv2D:output:0%layer2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
layer2/BiasAddu
layer2/ReluRelulayer2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
layer2/ReluЇ
pool2/AvgPoolAvgPoollayer2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
ksize
*
paddingVALID*
strides
2
pool2/AvgPool™
layer3/Conv2D/ReadVariableOpReadVariableOp%layer3_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02
layer3/Conv2D/ReadVariableOp…
layer3/Conv2DConv2Dpool2/AvgPool:output:0$layer3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingVALID*
strides
2
layer3/Conv2D°
layer3/BiasAdd/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
layer3/BiasAdd/ReadVariableOp§
layer3/BiasAddBiasAddlayer3/Conv2D:output:0%layer3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@2
layer3/BiasAddu
layer3/ReluRelulayer3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2
layer3/ReluЇ
pool3/AvgPoolAvgPoollayer3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
ksize
*
paddingVALID*
strides
2
pool3/AvgPoolЂ
layer4/Conv2D/ReadVariableOpReadVariableOp%layer4_conv2d_readvariableop_resource*'
_output_shapes
:@А*
dtype02
layer4/Conv2D/ReadVariableOp 
layer4/Conv2DConv2Dpool3/AvgPool:output:0$layer4/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
layer4/Conv2DҐ
layer4/BiasAdd/ReadVariableOpReadVariableOp&layer4_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
layer4/BiasAdd/ReadVariableOp•
layer4/BiasAddBiasAddlayer4/Conv2D:output:0%layer4/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer4/BiasAddv
layer4/ReluRelulayer4/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer4/Reluї
pool4/AvgPoolAvgPoollayer4/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
pool4/AvgPoolђ
layer5/Conv2D/ReadVariableOpReadVariableOp%layer5_conv2d_readvariableop_resource*(
_output_shapes
:АА*
dtype02
layer5/Conv2D/ReadVariableOp 
layer5/Conv2DConv2Dpool4/AvgPool:output:0$layer5/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
layer5/Conv2DҐ
layer5/BiasAdd/ReadVariableOpReadVariableOp&layer5_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
layer5/BiasAdd/ReadVariableOp•
layer5/BiasAddBiasAddlayer5/Conv2D:output:0%layer5/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer5/BiasAddv
layer5/ReluRelulayer5/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
layer5/Reluї
pool5/AvgPoolAvgPoollayer5/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
pool5/AvgPoolo
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€А   2
flatten/ConstР
flatten/ReshapeReshapepool5/AvgPool:output:0flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2
flatten/Reshape£
layer6/MatMul/ReadVariableOpReadVariableOp%layer6_matmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
layer6/MatMul/ReadVariableOpЪ
layer6/MatMulMatMulflatten/Reshape:output:0$layer6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/MatMul°
layer6/BiasAdd/ReadVariableOpReadVariableOp&layer6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer6/BiasAdd/ReadVariableOpЭ
layer6/BiasAddBiasAddlayer6/MatMul:product:0%layer6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/BiasAddv
layer6/SoftmaxSoftmaxlayer6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€2
layer6/Softmaxж
IdentityIdentitylayer6/Softmax:softmax:0^layer1/BiasAdd/ReadVariableOp^layer1/Conv2D/ReadVariableOp^layer2/BiasAdd/ReadVariableOp^layer2/Conv2D/ReadVariableOp^layer3/BiasAdd/ReadVariableOp^layer3/Conv2D/ReadVariableOp^layer4/BiasAdd/ReadVariableOp^layer4/Conv2D/ReadVariableOp^layer5/BiasAdd/ReadVariableOp^layer5/Conv2D/ReadVariableOp^layer6/BiasAdd/ReadVariableOp^layer6/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2>
layer1/BiasAdd/ReadVariableOplayer1/BiasAdd/ReadVariableOp2<
layer1/Conv2D/ReadVariableOplayer1/Conv2D/ReadVariableOp2>
layer2/BiasAdd/ReadVariableOplayer2/BiasAdd/ReadVariableOp2<
layer2/Conv2D/ReadVariableOplayer2/Conv2D/ReadVariableOp2>
layer3/BiasAdd/ReadVariableOplayer3/BiasAdd/ReadVariableOp2<
layer3/Conv2D/ReadVariableOplayer3/Conv2D/ReadVariableOp2>
layer4/BiasAdd/ReadVariableOplayer4/BiasAdd/ReadVariableOp2<
layer4/Conv2D/ReadVariableOplayer4/Conv2D/ReadVariableOp2>
layer5/BiasAdd/ReadVariableOplayer5/BiasAdd/ReadVariableOp2<
layer5/Conv2D/ReadVariableOplayer5/Conv2D/ReadVariableOp2>
layer6/BiasAdd/ReadVariableOplayer6/BiasAdd/ReadVariableOp2<
layer6/MatMul/ReadVariableOplayer6/MatMul/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
Р
Z
>__inference_pool2_layer_call_and_return_conditional_losses_381

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€ *
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
х
y
$__inference_layer2_layer_call_fn_975

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer2_layer_call_and_return_conditional_losses_3602
StatefulPartitionedCallЦ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
”

Ў
?__inference_layer5_layer_call_and_return_conditional_losses_480

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpЧ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:АА*
dtype02
Conv2D/ReadVariableOp•
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
Conv2DН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЙ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2	
BiasAdda
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
Relu†
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*7
_input_shapes&
$:€€€€€€€€€А::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
‘

ў
@__inference_layer5_layer_call_and_return_conditional_losses_1056

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpЧ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*(
_output_shapes
:АА*
dtype02
Conv2D/ReadVariableOp•
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
Conv2DН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЙ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2	
BiasAdda
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
Relu†
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*7
_input_shapes&
$:€€€€€€€€€А::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ж%
Ж
__inference__traced_save_1165
file_prefix,
(savev2_layer1_kernel_read_readvariableop*
&savev2_layer1_bias_read_readvariableop,
(savev2_layer2_kernel_read_readvariableop*
&savev2_layer2_bias_read_readvariableop,
(savev2_layer3_kernel_read_readvariableop*
&savev2_layer3_bias_read_readvariableop,
(savev2_layer4_kernel_read_readvariableop*
&savev2_layer4_bias_read_readvariableop,
(savev2_layer5_kernel_read_readvariableop*
&savev2_layer5_bias_read_readvariableop,
(savev2_layer6_kernel_read_readvariableop*
&savev2_layer6_bias_read_readvariableop
savev2_const

identity_1ИҐMergeV2CheckpointsП
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1Л
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard¶
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilenameµ
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*«
valueљBЇB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_namesҐ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*-
value$B"B B B B B B B B B B B B B 2
SaveV2/shape_and_slices≤
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0(savev2_layer1_kernel_read_readvariableop&savev2_layer1_bias_read_readvariableop(savev2_layer2_kernel_read_readvariableop&savev2_layer2_bias_read_readvariableop(savev2_layer3_kernel_read_readvariableop&savev2_layer3_bias_read_readvariableop(savev2_layer4_kernel_read_readvariableop&savev2_layer4_bias_read_readvariableop(savev2_layer5_kernel_read_readvariableop&savev2_layer5_bias_read_readvariableop(savev2_layer6_kernel_read_readvariableop&savev2_layer6_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
22
SaveV2Ї
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes°
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identitym

Identity_1IdentityIdentity:output:0^MergeV2Checkpoints*
T0*
_output_shapes
: 2

Identity_1"!

identity_1Identity_1:output:0*І
_input_shapesХ
Т: ::: : : @:@:@А:А:АА:А:	А:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
: : 

_output_shapes
: :,(
&
_output_shapes
: @: 

_output_shapes
:@:-)
'
_output_shapes
:@А:!

_output_shapes	
:А:.	*
(
_output_shapes
:АА:!


_output_shapes	
:А:%!

_output_shapes
:	А: 

_output_shapes
::

_output_shapes
: 
©
?
#__inference_pool1_layer_call_fn_955

inputs
identity«
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool1_layer_call_and_return_conditional_losses_3412
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€<<:W S
/
_output_shapes
:€€€€€€€€€<<
 
_user_specified_nameinputs
ъ
z
%__inference_layer5_layer_call_fn_1065

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer5_layer_call_and_return_conditional_losses_4802
StatefulPartitionedCallЧ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*7
_input_shapes&
$:€€€€€€€€€А::22
StatefulPartitionedCallStatefulPartitionedCall:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
°0
ж
A__inference_roshambo_layer_call_and_return_conditional_losses_634

inputs

layer1_597

layer1_599

layer2_603

layer2_605

layer3_609

layer3_611

layer4_615

layer4_617

layer5_621

layer5_623

layer6_628

layer6_630
identityИҐlayer1/StatefulPartitionedCallҐlayer2/StatefulPartitionedCallҐlayer3/StatefulPartitionedCallҐlayer4/StatefulPartitionedCallҐlayer5/StatefulPartitionedCallҐlayer6/StatefulPartitionedCallМ
layer1/StatefulPartitionedCallStatefulPartitionedCallinputs
layer1_597
layer1_599*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer1_layer_call_and_return_conditional_losses_3202 
layer1/StatefulPartitionedCallф
pool1/PartitionedCallPartitionedCall'layer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool1_layer_call_and_return_conditional_losses_3412
pool1/PartitionedCall§
layer2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0
layer2_603
layer2_605*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer2_layer_call_and_return_conditional_losses_3602 
layer2/StatefulPartitionedCallф
pool2/PartitionedCallPartitionedCall'layer2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool2_layer_call_and_return_conditional_losses_3812
pool2/PartitionedCall§
layer3/StatefulPartitionedCallStatefulPartitionedCallpool2/PartitionedCall:output:0
layer3_609
layer3_611*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer3_layer_call_and_return_conditional_losses_4002 
layer3/StatefulPartitionedCallф
pool3/PartitionedCallPartitionedCall'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool3_layer_call_and_return_conditional_losses_4212
pool3/PartitionedCall•
layer4/StatefulPartitionedCallStatefulPartitionedCallpool3/PartitionedCall:output:0
layer4_615
layer4_617*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer4_layer_call_and_return_conditional_losses_4402 
layer4/StatefulPartitionedCallх
pool4/PartitionedCallPartitionedCall'layer4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool4_layer_call_and_return_conditional_losses_4612
pool4/PartitionedCall•
layer5/StatefulPartitionedCallStatefulPartitionedCallpool4/PartitionedCall:output:0
layer5_621
layer5_623*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer5_layer_call_and_return_conditional_losses_4802 
layer5/StatefulPartitionedCallх
pool5/PartitionedCallPartitionedCall'layer5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool5_layer_call_and_return_conditional_losses_5012
pool5/PartitionedCallк
flatten/PartitionedCallPartitionedCallpool5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_flatten_layer_call_and_return_conditional_losses_5152
flatten/PartitionedCallЮ
layer6/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0
layer6_628
layer6_630*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer6_layer_call_and_return_conditional_losses_5342 
layer6/StatefulPartitionedCallЅ
IdentityIdentity'layer6/StatefulPartitionedCall:output:0^layer1/StatefulPartitionedCall^layer2/StatefulPartitionedCall^layer3/StatefulPartitionedCall^layer4/StatefulPartitionedCall^layer5/StatefulPartitionedCall^layer6/StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2@
layer4/StatefulPartitionedCalllayer4/StatefulPartitionedCall2@
layer5/StatefulPartitionedCalllayer5/StatefulPartitionedCall2@
layer6/StatefulPartitionedCalllayer6/StatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
ѓ	
У
&__inference_roshambo_layer_call_fn_661
input_1
unknown
	unknown_0
	unknown_1
	unknown_2
	unknown_3
	unknown_4
	unknown_5
	unknown_6
	unknown_7
	unknown_8
	unknown_9

unknown_10
identityИҐStatefulPartitionedCallш
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*.
_read_only_resource_inputs
	
*0
config_proto 

CPU

GPU2*0J 8В *J
fERC
A__inference_roshambo_layer_call_and_return_conditional_losses_6342
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
ц
z
%__inference_layer3_layer_call_fn_1005

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer3_layer_call_and_return_conditional_losses_4002
StatefulPartitionedCallЦ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€ ::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
 

Ў
?__inference_layer2_layer_call_and_return_conditional_losses_966

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ 2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€
 
_user_specified_nameinputs
Р
Z
>__inference_pool2_layer_call_and_return_conditional_losses_980

inputs
identityЫ
AvgPoolAvgPoolinputs*
T0*/
_output_shapes
:€€€€€€€€€ *
ksize
*
paddingVALID*
strides
2	
AvgPooll
IdentityIdentityAvgPool:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€ :W S
/
_output_shapes
:€€€€€€€€€ 
 
_user_specified_nameinputs
—

ў
@__inference_layer4_layer_call_and_return_conditional_losses_1026

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpЦ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*'
_output_shapes
:@А*
dtype02
Conv2D/ReadVariableOp•
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
Conv2DН
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02
BiasAdd/ReadVariableOpЙ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2	
BiasAdda
ReluReluBiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
Relu†
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
Ѓ
@
$__inference_pool5_layer_call_fn_1075

inputs
identity»
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool5_layer_call_and_return_conditional_losses_5012
PartitionedCallu
IdentityIdentityPartitionedCall:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
Ї
\
@__inference_flatten_layer_call_and_return_conditional_losses_515

inputs
identity_
ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€А   2
Consth
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2	
Reshapee
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
™
@
$__inference_pool3_layer_call_fn_1015

inputs
identity«
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool3_layer_call_and_return_conditional_losses_4212
PartitionedCallt
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2

Identity"
identityIdentity:output:0*.
_input_shapes
:€€€€€€€€€@:W S
/
_output_shapes
:€€€€€€€€€@
 
_user_specified_nameinputs
х
y
$__inference_layer1_layer_call_fn_945

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallъ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer1_layer_call_and_return_conditional_losses_3202
StatefulPartitionedCallЦ
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*/
_output_shapes
:€€€€€€€€€<<2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@@::22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
Ф
Z
>__inference_pool4_layer_call_and_return_conditional_losses_461

inputs
identityЬ
AvgPoolAvgPoolinputs*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2	
AvgPoolm
IdentityIdentityAvgPool:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А:X T
0
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
°0
ж
A__inference_roshambo_layer_call_and_return_conditional_losses_703

inputs

layer1_666

layer1_668

layer2_672

layer2_674

layer3_678

layer3_680

layer4_684

layer4_686

layer5_690

layer5_692

layer6_697

layer6_699
identityИҐlayer1/StatefulPartitionedCallҐlayer2/StatefulPartitionedCallҐlayer3/StatefulPartitionedCallҐlayer4/StatefulPartitionedCallҐlayer5/StatefulPartitionedCallҐlayer6/StatefulPartitionedCallМ
layer1/StatefulPartitionedCallStatefulPartitionedCallinputs
layer1_666
layer1_668*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€<<*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer1_layer_call_and_return_conditional_losses_3202 
layer1/StatefulPartitionedCallф
pool1/PartitionedCallPartitionedCall'layer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool1_layer_call_and_return_conditional_losses_3412
pool1/PartitionedCall§
layer2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0
layer2_672
layer2_674*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ *$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer2_layer_call_and_return_conditional_losses_3602 
layer2/StatefulPartitionedCallф
pool2/PartitionedCallPartitionedCall'layer2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€ * 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool2_layer_call_and_return_conditional_losses_3812
pool2/PartitionedCall§
layer3/StatefulPartitionedCallStatefulPartitionedCallpool2/PartitionedCall:output:0
layer3_678
layer3_680*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer3_layer_call_and_return_conditional_losses_4002 
layer3/StatefulPartitionedCallф
pool3/PartitionedCallPartitionedCall'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:€€€€€€€€€@* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool3_layer_call_and_return_conditional_losses_4212
pool3/PartitionedCall•
layer4/StatefulPartitionedCallStatefulPartitionedCallpool3/PartitionedCall:output:0
layer4_684
layer4_686*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer4_layer_call_and_return_conditional_losses_4402 
layer4/StatefulPartitionedCallх
pool4/PartitionedCallPartitionedCall'layer4/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool4_layer_call_and_return_conditional_losses_4612
pool4/PartitionedCall•
layer5/StatefulPartitionedCallStatefulPartitionedCallpool4/PartitionedCall:output:0
layer5_690
layer5_692*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer5_layer_call_and_return_conditional_losses_4802 
layer5/StatefulPartitionedCallх
pool5/PartitionedCallPartitionedCall'layer5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *0
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *G
fBR@
>__inference_pool5_layer_call_and_return_conditional_losses_5012
pool5/PartitionedCallк
flatten/PartitionedCallPartitionedCallpool5/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:€€€€€€€€€А* 
_read_only_resource_inputs
 *0
config_proto 

CPU

GPU2*0J 8В *I
fDRB
@__inference_flatten_layer_call_and_return_conditional_losses_5152
flatten/PartitionedCallЮ
layer6/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0
layer6_697
layer6_699*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer6_layer_call_and_return_conditional_losses_5342 
layer6/StatefulPartitionedCallЅ
IdentityIdentity'layer6/StatefulPartitionedCall:output:0^layer1/StatefulPartitionedCall^layer2/StatefulPartitionedCall^layer3/StatefulPartitionedCall^layer4/StatefulPartitionedCall^layer5/StatefulPartitionedCall^layer6/StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2@
layer4/StatefulPartitionedCalllayer4/StatefulPartitionedCall2@
layer5/StatefulPartitionedCalllayer5/StatefulPartitionedCall2@
layer6/StatefulPartitionedCalllayer6/StatefulPartitionedCall:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
 O
Ъ	
__inference__wrapped_model_305
input_12
.roshambo_layer1_conv2d_readvariableop_resource3
/roshambo_layer1_biasadd_readvariableop_resource2
.roshambo_layer2_conv2d_readvariableop_resource3
/roshambo_layer2_biasadd_readvariableop_resource2
.roshambo_layer3_conv2d_readvariableop_resource3
/roshambo_layer3_biasadd_readvariableop_resource2
.roshambo_layer4_conv2d_readvariableop_resource3
/roshambo_layer4_biasadd_readvariableop_resource2
.roshambo_layer5_conv2d_readvariableop_resource3
/roshambo_layer5_biasadd_readvariableop_resource2
.roshambo_layer6_matmul_readvariableop_resource3
/roshambo_layer6_biasadd_readvariableop_resource
identityИҐ&roshambo/layer1/BiasAdd/ReadVariableOpҐ%roshambo/layer1/Conv2D/ReadVariableOpҐ&roshambo/layer2/BiasAdd/ReadVariableOpҐ%roshambo/layer2/Conv2D/ReadVariableOpҐ&roshambo/layer3/BiasAdd/ReadVariableOpҐ%roshambo/layer3/Conv2D/ReadVariableOpҐ&roshambo/layer4/BiasAdd/ReadVariableOpҐ%roshambo/layer4/Conv2D/ReadVariableOpҐ&roshambo/layer5/BiasAdd/ReadVariableOpҐ%roshambo/layer5/Conv2D/ReadVariableOpҐ&roshambo/layer6/BiasAdd/ReadVariableOpҐ%roshambo/layer6/MatMul/ReadVariableOp≈
%roshambo/layer1/Conv2D/ReadVariableOpReadVariableOp.roshambo_layer1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype02'
%roshambo/layer1/Conv2D/ReadVariableOp’
roshambo/layer1/Conv2DConv2Dinput_1-roshambo/layer1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<*
paddingVALID*
strides
2
roshambo/layer1/Conv2DЉ
&roshambo/layer1/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02(
&roshambo/layer1/BiasAdd/ReadVariableOp»
roshambo/layer1/BiasAddBiasAddroshambo/layer1/Conv2D:output:0.roshambo/layer1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
roshambo/layer1/BiasAddР
roshambo/layer1/ReluRelu roshambo/layer1/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
roshambo/layer1/Relu’
roshambo/pool1/AvgPoolAvgPool"roshambo/layer1/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€*
ksize
*
paddingVALID*
strides
2
roshambo/pool1/AvgPool≈
%roshambo/layer2/Conv2D/ReadVariableOpReadVariableOp.roshambo_layer2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype02'
%roshambo/layer2/Conv2D/ReadVariableOpн
roshambo/layer2/Conv2DConv2Droshambo/pool1/AvgPool:output:0-roshambo/layer2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ *
paddingVALID*
strides
2
roshambo/layer2/Conv2DЉ
&roshambo/layer2/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02(
&roshambo/layer2/BiasAdd/ReadVariableOp»
roshambo/layer2/BiasAddBiasAddroshambo/layer2/Conv2D:output:0.roshambo/layer2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
roshambo/layer2/BiasAddР
roshambo/layer2/ReluRelu roshambo/layer2/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€ 2
roshambo/layer2/Relu’
roshambo/pool2/AvgPoolAvgPool"roshambo/layer2/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€ *
ksize
*
paddingVALID*
strides
2
roshambo/pool2/AvgPool≈
%roshambo/layer3/Conv2D/ReadVariableOpReadVariableOp.roshambo_layer3_conv2d_readvariableop_resource*&
_output_shapes
: @*
dtype02'
%roshambo/layer3/Conv2D/ReadVariableOpн
roshambo/layer3/Conv2DConv2Droshambo/pool2/AvgPool:output:0-roshambo/layer3/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@*
paddingVALID*
strides
2
roshambo/layer3/Conv2DЉ
&roshambo/layer3/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer3_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02(
&roshambo/layer3/BiasAdd/ReadVariableOp»
roshambo/layer3/BiasAddBiasAddroshambo/layer3/Conv2D:output:0.roshambo/layer3/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€@2
roshambo/layer3/BiasAddР
roshambo/layer3/ReluRelu roshambo/layer3/BiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€@2
roshambo/layer3/Relu’
roshambo/pool3/AvgPoolAvgPool"roshambo/layer3/Relu:activations:0*
T0*/
_output_shapes
:€€€€€€€€€@*
ksize
*
paddingVALID*
strides
2
roshambo/pool3/AvgPool∆
%roshambo/layer4/Conv2D/ReadVariableOpReadVariableOp.roshambo_layer4_conv2d_readvariableop_resource*'
_output_shapes
:@А*
dtype02'
%roshambo/layer4/Conv2D/ReadVariableOpо
roshambo/layer4/Conv2DConv2Droshambo/pool3/AvgPool:output:0-roshambo/layer4/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
roshambo/layer4/Conv2Dљ
&roshambo/layer4/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer4_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02(
&roshambo/layer4/BiasAdd/ReadVariableOp…
roshambo/layer4/BiasAddBiasAddroshambo/layer4/Conv2D:output:0.roshambo/layer4/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
roshambo/layer4/BiasAddС
roshambo/layer4/ReluRelu roshambo/layer4/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
roshambo/layer4/Relu÷
roshambo/pool4/AvgPoolAvgPool"roshambo/layer4/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
roshambo/pool4/AvgPool«
%roshambo/layer5/Conv2D/ReadVariableOpReadVariableOp.roshambo_layer5_conv2d_readvariableop_resource*(
_output_shapes
:АА*
dtype02'
%roshambo/layer5/Conv2D/ReadVariableOpо
roshambo/layer5/Conv2DConv2Droshambo/pool4/AvgPool:output:0-roshambo/layer5/Conv2D/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А*
paddingVALID*
strides
2
roshambo/layer5/Conv2Dљ
&roshambo/layer5/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer5_biasadd_readvariableop_resource*
_output_shapes	
:А*
dtype02(
&roshambo/layer5/BiasAdd/ReadVariableOp…
roshambo/layer5/BiasAddBiasAddroshambo/layer5/Conv2D:output:0.roshambo/layer5/BiasAdd/ReadVariableOp:value:0*
T0*0
_output_shapes
:€€€€€€€€€А2
roshambo/layer5/BiasAddС
roshambo/layer5/ReluRelu roshambo/layer5/BiasAdd:output:0*
T0*0
_output_shapes
:€€€€€€€€€А2
roshambo/layer5/Relu÷
roshambo/pool5/AvgPoolAvgPool"roshambo/layer5/Relu:activations:0*
T0*0
_output_shapes
:€€€€€€€€€А*
ksize
*
paddingVALID*
strides
2
roshambo/pool5/AvgPoolБ
roshambo/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"€€€€А   2
roshambo/flatten/Constі
roshambo/flatten/ReshapeReshaperoshambo/pool5/AvgPool:output:0roshambo/flatten/Const:output:0*
T0*(
_output_shapes
:€€€€€€€€€А2
roshambo/flatten/ReshapeЊ
%roshambo/layer6/MatMul/ReadVariableOpReadVariableOp.roshambo_layer6_matmul_readvariableop_resource*
_output_shapes
:	А*
dtype02'
%roshambo/layer6/MatMul/ReadVariableOpЊ
roshambo/layer6/MatMulMatMul!roshambo/flatten/Reshape:output:0-roshambo/layer6/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
roshambo/layer6/MatMulЉ
&roshambo/layer6/BiasAdd/ReadVariableOpReadVariableOp/roshambo_layer6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02(
&roshambo/layer6/BiasAdd/ReadVariableOpЅ
roshambo/layer6/BiasAddBiasAdd roshambo/layer6/MatMul:product:0.roshambo/layer6/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
roshambo/layer6/BiasAddС
roshambo/layer6/SoftmaxSoftmax roshambo/layer6/BiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€2
roshambo/layer6/Softmaxџ
IdentityIdentity!roshambo/layer6/Softmax:softmax:0'^roshambo/layer1/BiasAdd/ReadVariableOp&^roshambo/layer1/Conv2D/ReadVariableOp'^roshambo/layer2/BiasAdd/ReadVariableOp&^roshambo/layer2/Conv2D/ReadVariableOp'^roshambo/layer3/BiasAdd/ReadVariableOp&^roshambo/layer3/Conv2D/ReadVariableOp'^roshambo/layer4/BiasAdd/ReadVariableOp&^roshambo/layer4/Conv2D/ReadVariableOp'^roshambo/layer5/BiasAdd/ReadVariableOp&^roshambo/layer5/Conv2D/ReadVariableOp'^roshambo/layer6/BiasAdd/ReadVariableOp&^roshambo/layer6/MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*^
_input_shapesM
K:€€€€€€€€€@@::::::::::::2P
&roshambo/layer1/BiasAdd/ReadVariableOp&roshambo/layer1/BiasAdd/ReadVariableOp2N
%roshambo/layer1/Conv2D/ReadVariableOp%roshambo/layer1/Conv2D/ReadVariableOp2P
&roshambo/layer2/BiasAdd/ReadVariableOp&roshambo/layer2/BiasAdd/ReadVariableOp2N
%roshambo/layer2/Conv2D/ReadVariableOp%roshambo/layer2/Conv2D/ReadVariableOp2P
&roshambo/layer3/BiasAdd/ReadVariableOp&roshambo/layer3/BiasAdd/ReadVariableOp2N
%roshambo/layer3/Conv2D/ReadVariableOp%roshambo/layer3/Conv2D/ReadVariableOp2P
&roshambo/layer4/BiasAdd/ReadVariableOp&roshambo/layer4/BiasAdd/ReadVariableOp2N
%roshambo/layer4/Conv2D/ReadVariableOp%roshambo/layer4/Conv2D/ReadVariableOp2P
&roshambo/layer5/BiasAdd/ReadVariableOp&roshambo/layer5/BiasAdd/ReadVariableOp2N
%roshambo/layer5/Conv2D/ReadVariableOp%roshambo/layer5/Conv2D/ReadVariableOp2P
&roshambo/layer6/BiasAdd/ReadVariableOp&roshambo/layer6/BiasAdd/ReadVariableOp2N
%roshambo/layer6/MatMul/ReadVariableOp%roshambo/layer6/MatMul/ReadVariableOp:X T
/
_output_shapes
:€€€€€€€€€@@
!
_user_specified_name	input_1
 

Ў
?__inference_layer1_layer_call_and_return_conditional_losses_320

inputs"
conv2d_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐConv2D/ReadVariableOpХ
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype02
Conv2D/ReadVariableOp§
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<*
paddingVALID*
strides
2
Conv2DМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpИ
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:€€€€€€€€€<<2	
BiasAdd`
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:€€€€€€€€€<<2
ReluЯ
IdentityIdentityRelu:activations:0^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*
T0*/
_output_shapes
:€€€€€€€€€<<2

Identity"
identityIdentity:output:0*6
_input_shapes%
#:€€€€€€€€€@@::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:€€€€€€€€€@@
 
_user_specified_nameinputs
Ў
z
%__inference_layer6_layer_call_fn_1106

inputs
unknown
	unknown_0
identityИҐStatefulPartitionedCallт
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:€€€€€€€€€*$
_read_only_resource_inputs
*0
config_proto 

CPU

GPU2*0J 8В *H
fCRA
?__inference_layer6_layer_call_and_return_conditional_losses_5342
StatefulPartitionedCallО
IdentityIdentity StatefulPartitionedCall:output:0^StatefulPartitionedCall*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А::22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs
х	
ў
@__inference_layer6_layer_call_and_return_conditional_losses_1097

inputs"
matmul_readvariableop_resource#
biasadd_readvariableop_resource
identityИҐBiasAdd/ReadVariableOpҐMatMul/ReadVariableOpО
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	А*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2
MatMulМ
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOpБ
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:€€€€€€€€€2	
BiasAdda
SoftmaxSoftmaxBiasAdd:output:0*
T0*'
_output_shapes
:€€€€€€€€€2	
SoftmaxЦ
IdentityIdentitySoftmax:softmax:0^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
T0*'
_output_shapes
:€€€€€€€€€2

Identity"
identityIdentity:output:0*/
_input_shapes
:€€€€€€€€€А::20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:€€€€€€€€€А
 
_user_specified_nameinputs"¬L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*±
serving_defaultЭ
C
input_18
serving_default_input_1:0€€€€€€€€€@@:
layer60
StatefulPartitionedCall:0€€€€€€€€€tensorflow/serving/predict:рк
Жl
layer-0
layer_with_weights-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer-4
layer_with_weights-2
layer-5
layer-6
layer_with_weights-3
layer-7
	layer-8

layer_with_weights-4

layer-9
layer-10
layer-11
layer_with_weights-5
layer-12
trainable_variables
regularization_losses
	variables
	keras_api

signatures
Р_default_save_signature
+С&call_and_return_all_conditional_losses
Т__call__"€g
_tf_keras_networkгg{"class_name": "Functional", "name": "roshambo", "trainable": true, "expects_training_arg": true, "dtype": "float32", "batch_input_shape": null, "must_restore_from_config": false, "config": {"name": "roshambo", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 64, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": []}, {"class_name": "Conv2D", "config": {"name": "layer1", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [5, 5]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer1", "inbound_nodes": [[["input_1", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool1", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool1", "inbound_nodes": [[["layer1", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer2", "inbound_nodes": [[["pool1", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool2", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool2", "inbound_nodes": [[["layer2", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer3", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer3", "inbound_nodes": [[["pool2", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool3", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool3", "inbound_nodes": [[["layer3", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer4", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer4", "inbound_nodes": [[["pool3", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool4", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool4", "inbound_nodes": [[["layer4", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer5", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer5", "inbound_nodes": [[["pool4", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool5", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool5", "inbound_nodes": [[["layer5", 0, 0, {}]]]}, {"class_name": "Flatten", "config": {"name": "flatten", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten", "inbound_nodes": [[["pool5", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "layer6", "trainable": true, "dtype": "float32", "units": 4, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer6", "inbound_nodes": [[["flatten", 0, 0, {}]]]}], "input_layers": [["input_1", 0, 0]], "output_layers": [["layer6", 0, 0]]}, "input_spec": [{"class_name": "InputSpec", "config": {"dtype": null, "shape": {"class_name": "__tuple__", "items": [null, 64, 64, 1]}, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}], "build_input_shape": {"class_name": "TensorShape", "items": [null, 64, 64, 1]}, "is_graph_network": true, "keras_version": "2.5.0", "backend": "tensorflow", "model_config": {"class_name": "Functional", "config": {"name": "roshambo", "layers": [{"class_name": "InputLayer", "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 64, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}, "name": "input_1", "inbound_nodes": []}, {"class_name": "Conv2D", "config": {"name": "layer1", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [5, 5]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer1", "inbound_nodes": [[["input_1", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool1", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool1", "inbound_nodes": [[["layer1", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer2", "inbound_nodes": [[["pool1", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool2", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool2", "inbound_nodes": [[["layer2", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer3", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer3", "inbound_nodes": [[["pool2", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool3", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool3", "inbound_nodes": [[["layer3", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer4", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer4", "inbound_nodes": [[["pool3", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool4", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool4", "inbound_nodes": [[["layer4", 0, 0, {}]]]}, {"class_name": "Conv2D", "config": {"name": "layer5", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer5", "inbound_nodes": [[["pool4", 0, 0, {}]]]}, {"class_name": "AveragePooling2D", "config": {"name": "pool5", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "name": "pool5", "inbound_nodes": [[["layer5", 0, 0, {}]]]}, {"class_name": "Flatten", "config": {"name": "flatten", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "name": "flatten", "inbound_nodes": [[["pool5", 0, 0, {}]]]}, {"class_name": "Dense", "config": {"name": "layer6", "trainable": true, "dtype": "float32", "units": 4, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "name": "layer6", "inbound_nodes": [[["flatten", 0, 0, {}]]]}], "input_layers": [["input_1", 0, 0]], "output_layers": [["layer6", 0, 0]]}}}
щ"ц
_tf_keras_input_layer÷{"class_name": "InputLayer", "name": "input_1", "dtype": "float32", "sparse": false, "ragged": false, "batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 64, 1]}, "config": {"batch_input_shape": {"class_name": "__tuple__", "items": [null, 64, 64, 1]}, "dtype": "float32", "sparse": false, "ragged": false, "name": "input_1"}}
п	

kernel
bias
trainable_variables
regularization_losses
	variables
	keras_api
+У&call_and_return_all_conditional_losses
Ф__call__"»
_tf_keras_layerЃ{"class_name": "Conv2D", "name": "layer1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer1", "trainable": true, "dtype": "float32", "filters": 16, "kernel_size": {"class_name": "__tuple__", "items": [5, 5]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 1}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 64, 64, 1]}}
с
trainable_variables
regularization_losses
	variables
	keras_api
+Х&call_and_return_all_conditional_losses
Ц__call__"а
_tf_keras_layer∆{"class_name": "AveragePooling2D", "name": "pool1", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "pool1", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}}
с	

kernel
bias
trainable_variables
 regularization_losses
!	variables
"	keras_api
+Ч&call_and_return_all_conditional_losses
Ш__call__" 
_tf_keras_layer∞{"class_name": "Conv2D", "name": "layer2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer2", "trainable": true, "dtype": "float32", "filters": 32, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 16}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 30, 30, 16]}}
с
#trainable_variables
$regularization_losses
%	variables
&	keras_api
+Щ&call_and_return_all_conditional_losses
Ъ__call__"а
_tf_keras_layer∆{"class_name": "AveragePooling2D", "name": "pool2", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "pool2", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}}
с	

'kernel
(bias
)trainable_variables
*regularization_losses
+	variables
,	keras_api
+Ы&call_and_return_all_conditional_losses
Ь__call__" 
_tf_keras_layer∞{"class_name": "Conv2D", "name": "layer3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer3", "trainable": true, "dtype": "float32", "filters": 64, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 32}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 14, 14, 32]}}
с
-trainable_variables
.regularization_losses
/	variables
0	keras_api
+Э&call_and_return_all_conditional_losses
Ю__call__"а
_tf_keras_layer∆{"class_name": "AveragePooling2D", "name": "pool3", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "pool3", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}}
р	

1kernel
2bias
3trainable_variables
4regularization_losses
5	variables
6	keras_api
+Я&call_and_return_all_conditional_losses
†__call__"…
_tf_keras_layerѓ{"class_name": "Conv2D", "name": "layer4", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer4", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [3, 3]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 64}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 6, 6, 64]}}
с
7trainable_variables
8regularization_losses
9	variables
:	keras_api
+°&call_and_return_all_conditional_losses
Ґ__call__"а
_tf_keras_layer∆{"class_name": "AveragePooling2D", "name": "pool4", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "pool4", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}}
т	

;kernel
<bias
=trainable_variables
>regularization_losses
?	variables
@	keras_api
+£&call_and_return_all_conditional_losses
§__call__"Ћ
_tf_keras_layer±{"class_name": "Conv2D", "name": "layer5", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer5", "trainable": true, "dtype": "float32", "filters": 128, "kernel_size": {"class_name": "__tuple__", "items": [1, 1]}, "strides": {"class_name": "__tuple__", "items": [1, 1]}, "padding": "valid", "data_format": "channels_last", "dilation_rate": {"class_name": "__tuple__", "items": [1, 1]}, "groups": 1, "activation": "relu", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 4, "axes": {"-1": 128}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 2, 2, 128]}}
с
Atrainable_variables
Bregularization_losses
C	variables
D	keras_api
+•&call_and_return_all_conditional_losses
¶__call__"а
_tf_keras_layer∆{"class_name": "AveragePooling2D", "name": "pool5", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "pool5", "trainable": true, "dtype": "float32", "pool_size": {"class_name": "__tuple__", "items": [2, 2]}, "padding": "valid", "strides": {"class_name": "__tuple__", "items": [2, 2]}, "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": 4, "max_ndim": null, "min_ndim": null, "axes": {}}}}
д
Etrainable_variables
Fregularization_losses
G	variables
H	keras_api
+І&call_and_return_all_conditional_losses
®__call__"”
_tf_keras_layerє{"class_name": "Flatten", "name": "flatten", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "flatten", "trainable": true, "dtype": "float32", "data_format": "channels_last"}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 1, "axes": {}}}}
ф

Ikernel
Jbias
Ktrainable_variables
Lregularization_losses
M	variables
N	keras_api
+©&call_and_return_all_conditional_losses
™__call__"Ќ
_tf_keras_layer≥{"class_name": "Dense", "name": "layer6", "trainable": true, "expects_training_arg": false, "dtype": "float32", "batch_input_shape": null, "stateful": false, "must_restore_from_config": false, "config": {"name": "layer6", "trainable": true, "dtype": "float32", "units": 4, "activation": "softmax", "use_bias": true, "kernel_initializer": {"class_name": "GlorotUniform", "config": {"seed": null}}, "bias_initializer": {"class_name": "Zeros", "config": {}}, "kernel_regularizer": null, "bias_regularizer": null, "activity_regularizer": null, "kernel_constraint": null, "bias_constraint": null}, "input_spec": {"class_name": "InputSpec", "config": {"dtype": null, "shape": null, "ndim": null, "max_ndim": null, "min_ndim": 2, "axes": {"-1": 128}}}, "build_input_shape": {"class_name": "TensorShape", "items": [null, 128]}}
v
0
1
2
3
'4
(5
16
27
;8
<9
I10
J11"
trackable_list_wrapper
 "
trackable_list_wrapper
v
0
1
2
3
'4
(5
16
27
;8
<9
I10
J11"
trackable_list_wrapper
ќ
trainable_variables
Ometrics

Players
regularization_losses
	variables
Qnon_trainable_variables
Rlayer_metrics
Slayer_regularization_losses
Т__call__
Р_default_save_signature
+С&call_and_return_all_conditional_losses
'С"call_and_return_conditional_losses"
_generic_user_object
-
Ђserving_default"
signature_map
':%2layer1/kernel
:2layer1/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
∞
trainable_variables
Tmetrics

Ulayers
regularization_losses
	variables
Vnon_trainable_variables
Wlayer_metrics
Xlayer_regularization_losses
Ф__call__
+У&call_and_return_all_conditional_losses
'У"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
∞
trainable_variables
Ymetrics

Zlayers
regularization_losses
	variables
[non_trainable_variables
\layer_metrics
]layer_regularization_losses
Ц__call__
+Х&call_and_return_all_conditional_losses
'Х"call_and_return_conditional_losses"
_generic_user_object
':% 2layer2/kernel
: 2layer2/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
∞
trainable_variables
^metrics

_layers
 regularization_losses
!	variables
`non_trainable_variables
alayer_metrics
blayer_regularization_losses
Ш__call__
+Ч&call_and_return_all_conditional_losses
'Ч"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
∞
#trainable_variables
cmetrics

dlayers
$regularization_losses
%	variables
enon_trainable_variables
flayer_metrics
glayer_regularization_losses
Ъ__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses"
_generic_user_object
':% @2layer3/kernel
:@2layer3/bias
.
'0
(1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
'0
(1"
trackable_list_wrapper
∞
)trainable_variables
hmetrics

ilayers
*regularization_losses
+	variables
jnon_trainable_variables
klayer_metrics
llayer_regularization_losses
Ь__call__
+Ы&call_and_return_all_conditional_losses
'Ы"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
∞
-trainable_variables
mmetrics

nlayers
.regularization_losses
/	variables
onon_trainable_variables
player_metrics
qlayer_regularization_losses
Ю__call__
+Э&call_and_return_all_conditional_losses
'Э"call_and_return_conditional_losses"
_generic_user_object
(:&@А2layer4/kernel
:А2layer4/bias
.
10
21"
trackable_list_wrapper
 "
trackable_list_wrapper
.
10
21"
trackable_list_wrapper
∞
3trainable_variables
rmetrics

slayers
4regularization_losses
5	variables
tnon_trainable_variables
ulayer_metrics
vlayer_regularization_losses
†__call__
+Я&call_and_return_all_conditional_losses
'Я"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
∞
7trainable_variables
wmetrics

xlayers
8regularization_losses
9	variables
ynon_trainable_variables
zlayer_metrics
{layer_regularization_losses
Ґ__call__
+°&call_and_return_all_conditional_losses
'°"call_and_return_conditional_losses"
_generic_user_object
):'АА2layer5/kernel
:А2layer5/bias
.
;0
<1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
;0
<1"
trackable_list_wrapper
±
=trainable_variables
|metrics

}layers
>regularization_losses
?	variables
~non_trainable_variables
layer_metrics
 Аlayer_regularization_losses
§__call__
+£&call_and_return_all_conditional_losses
'£"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
µ
Atrainable_variables
Бmetrics
Вlayers
Bregularization_losses
C	variables
Гnon_trainable_variables
Дlayer_metrics
 Еlayer_regularization_losses
¶__call__
+•&call_and_return_all_conditional_losses
'•"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
µ
Etrainable_variables
Жmetrics
Зlayers
Fregularization_losses
G	variables
Иnon_trainable_variables
Йlayer_metrics
 Кlayer_regularization_losses
®__call__
+І&call_and_return_all_conditional_losses
'І"call_and_return_conditional_losses"
_generic_user_object
 :	А2layer6/kernel
:2layer6/bias
.
I0
J1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
I0
J1"
trackable_list_wrapper
µ
Ktrainable_variables
Лmetrics
Мlayers
Lregularization_losses
M	variables
Нnon_trainable_variables
Оlayer_metrics
 Пlayer_regularization_losses
™__call__
+©&call_and_return_all_conditional_losses
'©"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
~
0
1
2
3
4
5
6
7
	8

9
10
11
12"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
д2б
__inference__wrapped_model_305Њ
Л≤З
FullArgSpec
argsЪ 
varargsjargs
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *.Ґ+
)К&
input_1€€€€€€€€€@@
“2ѕ
A__inference_roshambo_layer_call_and_return_conditional_losses_867
A__inference_roshambo_layer_call_and_return_conditional_losses_814
A__inference_roshambo_layer_call_and_return_conditional_losses_551
A__inference_roshambo_layer_call_and_return_conditional_losses_591ј
Ј≤≥
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults™ 
annotations™ *
 
ж2г
&__inference_roshambo_layer_call_fn_896
&__inference_roshambo_layer_call_fn_661
&__inference_roshambo_layer_call_fn_925
&__inference_roshambo_layer_call_fn_730ј
Ј≤≥
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults™ 
annotations™ *
 
й2ж
?__inference_layer1_layer_call_and_return_conditional_losses_936Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ќ2Ћ
$__inference_layer1_layer_call_fn_945Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
и2е
>__inference_pool1_layer_call_and_return_conditional_losses_950Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ќ2 
#__inference_pool1_layer_call_fn_955Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
й2ж
?__inference_layer2_layer_call_and_return_conditional_losses_966Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ќ2Ћ
$__inference_layer2_layer_call_fn_975Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
и2е
>__inference_pool2_layer_call_and_return_conditional_losses_980Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
Ќ2 
#__inference_pool2_layer_call_fn_985Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
й2ж
?__inference_layer3_layer_call_and_return_conditional_losses_996Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ѕ2ћ
%__inference_layer3_layer_call_fn_1005Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
й2ж
?__inference_pool3_layer_call_and_return_conditional_losses_1010Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ќ2Ћ
$__inference_pool3_layer_call_fn_1015Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
к2з
@__inference_layer4_layer_call_and_return_conditional_losses_1026Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ѕ2ћ
%__inference_layer4_layer_call_fn_1035Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
й2ж
?__inference_pool4_layer_call_and_return_conditional_losses_1040Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ќ2Ћ
$__inference_pool4_layer_call_fn_1045Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
к2з
@__inference_layer5_layer_call_and_return_conditional_losses_1056Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ѕ2ћ
%__inference_layer5_layer_call_fn_1065Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
й2ж
?__inference_pool5_layer_call_and_return_conditional_losses_1070Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ќ2Ћ
$__inference_pool5_layer_call_fn_1075Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
л2и
A__inference_flatten_layer_call_and_return_conditional_losses_1081Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
–2Ќ
&__inference_flatten_layer_call_fn_1086Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
к2з
@__inference_layer6_layer_call_and_return_conditional_losses_1097Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
ѕ2ћ
%__inference_layer6_layer_call_fn_1106Ґ
Щ≤Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 
»B≈
!__inference_signature_wrapper_761input_1"Ф
Н≤Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotations™ *
 Ы
__inference__wrapped_model_305y'(12;<IJ8Ґ5
.Ґ+
)К&
input_1€€€€€€€€€@@
™ "/™,
*
layer6 К
layer6€€€€€€€€€І
A__inference_flatten_layer_call_and_return_conditional_losses_1081b8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "&Ґ#
К
0€€€€€€€€€А
Ъ 
&__inference_flatten_layer_call_fn_1086U8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "К€€€€€€€€€Аѓ
?__inference_layer1_layer_call_and_return_conditional_losses_936l7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@@
™ "-Ґ*
#К 
0€€€€€€€€€<<
Ъ З
$__inference_layer1_layer_call_fn_945_7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@@
™ " К€€€€€€€€€<<ѓ
?__inference_layer2_layer_call_and_return_conditional_losses_966l7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ "-Ґ*
#К 
0€€€€€€€€€ 
Ъ З
$__inference_layer2_layer_call_fn_975_7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€
™ " К€€€€€€€€€ ѓ
?__inference_layer3_layer_call_and_return_conditional_losses_996l'(7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ "-Ґ*
#К 
0€€€€€€€€€@
Ъ И
%__inference_layer3_layer_call_fn_1005_'(7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ " К€€€€€€€€€@±
@__inference_layer4_layer_call_and_return_conditional_losses_1026m127Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ Й
%__inference_layer4_layer_call_fn_1035`127Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ "!К€€€€€€€€€А≤
@__inference_layer5_layer_call_and_return_conditional_losses_1056n;<8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ К
%__inference_layer5_layer_call_fn_1065a;<8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "!К€€€€€€€€€А°
@__inference_layer6_layer_call_and_return_conditional_losses_1097]IJ0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А
™ "%Ґ"
К
0€€€€€€€€€
Ъ y
%__inference_layer6_layer_call_fn_1106PIJ0Ґ-
&Ґ#
!К
inputs€€€€€€€€€А
™ "К€€€€€€€€€™
>__inference_pool1_layer_call_and_return_conditional_losses_950h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€<<
™ "-Ґ*
#К 
0€€€€€€€€€
Ъ В
#__inference_pool1_layer_call_fn_955[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€<<
™ " К€€€€€€€€€™
>__inference_pool2_layer_call_and_return_conditional_losses_980h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ "-Ґ*
#К 
0€€€€€€€€€ 
Ъ В
#__inference_pool2_layer_call_fn_985[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€ 
™ " К€€€€€€€€€ Ђ
?__inference_pool3_layer_call_and_return_conditional_losses_1010h7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ "-Ґ*
#К 
0€€€€€€€€€@
Ъ Г
$__inference_pool3_layer_call_fn_1015[7Ґ4
-Ґ*
(К%
inputs€€€€€€€€€@
™ " К€€€€€€€€€@≠
?__inference_pool4_layer_call_and_return_conditional_losses_1040j8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ Е
$__inference_pool4_layer_call_fn_1045]8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "!К€€€€€€€€€А≠
?__inference_pool5_layer_call_and_return_conditional_losses_1070j8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ ".Ґ+
$К!
0€€€€€€€€€А
Ъ Е
$__inference_pool5_layer_call_fn_1075]8Ґ5
.Ґ+
)К&
inputs€€€€€€€€€А
™ "!К€€€€€€€€€АЉ
A__inference_roshambo_layer_call_and_return_conditional_losses_551w'(12;<IJ@Ґ=
6Ґ3
)К&
input_1€€€€€€€€€@@
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ Љ
A__inference_roshambo_layer_call_and_return_conditional_losses_591w'(12;<IJ@Ґ=
6Ґ3
)К&
input_1€€€€€€€€€@@
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ ї
A__inference_roshambo_layer_call_and_return_conditional_losses_814v'(12;<IJ?Ґ<
5Ґ2
(К%
inputs€€€€€€€€€@@
p

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ ї
A__inference_roshambo_layer_call_and_return_conditional_losses_867v'(12;<IJ?Ґ<
5Ґ2
(К%
inputs€€€€€€€€€@@
p 

 
™ "%Ґ"
К
0€€€€€€€€€
Ъ Ф
&__inference_roshambo_layer_call_fn_661j'(12;<IJ@Ґ=
6Ґ3
)К&
input_1€€€€€€€€€@@
p

 
™ "К€€€€€€€€€Ф
&__inference_roshambo_layer_call_fn_730j'(12;<IJ@Ґ=
6Ґ3
)К&
input_1€€€€€€€€€@@
p 

 
™ "К€€€€€€€€€У
&__inference_roshambo_layer_call_fn_896i'(12;<IJ?Ґ<
5Ґ2
(К%
inputs€€€€€€€€€@@
p

 
™ "К€€€€€€€€€У
&__inference_roshambo_layer_call_fn_925i'(12;<IJ?Ґ<
5Ґ2
(К%
inputs€€€€€€€€€@@
p 

 
™ "К€€€€€€€€€™
!__inference_signature_wrapper_761Д'(12;<IJCҐ@
Ґ 
9™6
4
input_1)К&
input_1€€€€€€€€€@@"/™,
*
layer6 К
layer6€€€€€€€€€