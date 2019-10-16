package random;

public class RandomGenerator {
	public int rand_number(int min,int max){
		int range = max - min + 1; 
		int rand = (int)(Math.random() * range) + min;
		return rand;
	}
	
	public boolean present(int n, int [] ar){
		int i=0;
		while(ar[i]!=-1){
			if(n==ar[i])
				return true;
			i++;
		}
		return false;
	}
	
	public int[] rand_array(){
		int[] random_array=new int[15];
		int i=0,n;
		for(i=0;i<15;i++){random_array[i]=-1;}
		i=0;
		while(i<15){
			n=rand_number(1,15);
			if(!present(n,random_array)){
				random_array[i]=n;
				System.out.println(n);
				i++;
			}
		}
	
		return random_array;
	}
}
