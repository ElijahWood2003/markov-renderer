/// @function	check_stochastic(P)
/// @param {P}		The matrix to be checked
/// @description	This will check whether the input matrix is stochastic.
///					Returns true if it is; false otherwise.

function check_stochastic(P){
	for(var i = 0; i < array_length(P); i++){
		// row sum
		rsum = 0
		for(var j = 0; j < array_length(P[0]); j++){
			rsum += P[i][j]
			if(P[i][j] < 0 || P[i][j] > 1 || rsum > 1){
				return false
			}
		}
		if(rsum != 1){
			return false
		}
	}
	
	return true
}