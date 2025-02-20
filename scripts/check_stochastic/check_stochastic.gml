/// @function	check_stochastic(P)
/// @param {P}		P = matrix to be checked
/// @param {size}	size = size of the matrix (size x size) that will be checked
/// @description	This will check whether the input matrix is stochastic.
///					Returns true if it is; false otherwise.

function check_stochastic(P, size){
	length = max(array_length(P), size)		// if size > P length just take matrix size
	
	for(var i = 0; i < length; i++){
		
		// row sum
		rsum = 0
		for(var j = 0; j < length; j++){
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