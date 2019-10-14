package random;

public class RandomGenerator {
	public int rand_number(int min,int max){
		int range = max - min + 1; 
		int rand = (int)(Math.random() * range) + min;
		return rand;
	}
	
	public int[] rand_array() {
		int arr[] = new int[15];
        int flag=0;
        
        int max = 15, min =1;
        int range = max-min;
        int n=0;
        while(true){
                flag=0;
                int num = (int)((Math.random()*range)+1);                     
                for(int j=0;j<15;j++){
                        if(arr[j] == num)
                                flag=1;   
                }
                
                if(flag == 0){
                        arr[n] = num;
                        n++;
                }
                if(n == 15)        
                        break;      
                
        } 
        return arr;
	}
}
