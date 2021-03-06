package h3d.shader;

class SkinTangent extends SkinBase {

	static var SRC = {

		@input var input : {
			var position : Vec3;
			var normal : Vec3;
			var tangent : Vec3;
			var weights : Vec3;
			var indexes : Bytes4;
		};

		var transformedTangent : Vec4;

		function vertex() {
			transformedPosition =
				(relativePosition * bonesMatrixes[input.indexes.x]) * input.weights.x +
				(relativePosition * bonesMatrixes[input.indexes.y]) * input.weights.y +
				(relativePosition * bonesMatrixes[input.indexes.z]) * input.weights.z;
			transformedNormal = normalize(
				(input.normal * mat3(bonesMatrixes[input.indexes.x])) * input.weights.x +
				(input.normal * mat3(bonesMatrixes[input.indexes.y])) * input.weights.y +
				(input.normal * mat3(bonesMatrixes[input.indexes.z])) * input.weights.z);
			transformedTangent = vec4(normalize(
				(input.tangent.xyz * mat3(bonesMatrixes[input.indexes.x])) * input.weights.x +
				(input.tangent.xyz * mat3(bonesMatrixes[input.indexes.y])) * input.weights.y +
				(input.tangent.xyz * mat3(bonesMatrixes[input.indexes.z])) * input.weights.z
			), transformedTangent.w);
		}

	};

}