package main;

import java.util.Arrays;

class GFG {
    // Function to get slice of a primitive array in Java
    public static int[] getSliceOfArray(int[] arr, 
                                     int start, int end)
    {
  
        // Get the slice of the Array
        int[] slice = new int[end - start];
  
        // Copy elements of arr to slice
        for (int i = 0; i < slice.length; i++) {
            slice[i] = arr[start + i];
        }
  
        // return the slice
        return slice;
    }
    public static void main(String[] args)
    {
  
        // Get the array, startIndex and endIndex
        int[] arr = { 1, 2, 3, 4, 5 };
        int start = 2, end = 4;
  
        // Get the slice of the array
        int[] slice = getSliceOfArray(arr, start, end + 1);
  
        // Print the slice of the array
        System.out.println(Arrays.toString(slice));
    }
}