import tensorflow as tf
import math
#input is a two-dim array [num_rows*num_cols][nr_bands]
def PolarCoordinates(input):
    pixel_depth = 1
    nr_bands = input.shape[1]
    datasetPow2 = tf.math.pow(input,2)
    sum2=tf.add(datasetPow2[:,nr_bands-1],datasetPow2[:,nr_bands-2])
    sumsq=tf.math.sqrt(sum2)

    B11 = 2. * tf.math.atan(tf.divide(tf.add(input[:,nr_bands-2], sumsq), input[:,nr_bands-1]))

    BandsConcat = tf.concat([[tf.math.atan(tf.divide(input[:,nr_bands-3],sumsq))], [B11]], 0)

    del B11

    for band in range(nr_bands-4,-1,-1):
      sum2 = tf.add(sum2, datasetPow2[:,band+1])

      sumsq = tf.math.sqrt(sum2)

      BandsConcat = tf.concat([[tf.math.atan(tf.divide(input[:,band],sumsq))], BandsConcat], 0)
      
    sum2 = tf.add(sum2, datasetPow2[:,0])
    sumsq = tf.math.sqrt(sum2)  
    BandsConcat = tf.concat([[sumsq], BandsConcat], 0)
    BandsConcat = tf.transpose(BandsConcat)

    BandsConcat = tf.where(tf.math.greater(BandsConcat,2*math.pi),BandsConcat-math.pi,BandsConcat)
    BandsConcat = tf.where(tf.math.less(BandsConcat,0),BandsConcat+math.pi,BandsConcat)
    BandsConcat = tf.where(tf.math.is_nan(BandsConcat), tf.zeros_like(BandsConcat), BandsConcat)
    BandsConcat = ((BandsConcat - tf.math.reduce_min(BandsConcat)) / (tf.math.reduce_max(BandsConcat) - tf.math.reduce_min(BandsConcat))) * pixel_depth
    return BandsConcat
