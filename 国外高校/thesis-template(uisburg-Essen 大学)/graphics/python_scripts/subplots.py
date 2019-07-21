import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import pylab
from pathlib import Path
import os

sns.set()
plt.rcParams["font.family"] = "Times New Roman"
plt.rcParams["mathtext.fontset"] = "dejavuserif"
params = {'legend.fontsize': 22,
          'axes.labelsize': 24,
          'axes.titlesize': 24,
          'xtick.labelsize': 22,
          'ytick.labelsize': 22,
          'figure.figsize': (12, 10)}
pylab.rcParams.update(params)


if __name__ == '__main__':

    saveFig = input('Do you want to save the figures? (Y/N)')
    path = str(Path(os.path.abspath(__file__)).parent.parent)

    while saveFig.lower() not in ('y', 'n'):
        saveFig = input('Please enter only Y or N!')

    tips = sns.load_dataset("tips")  # load embedded dataset
    plt.figure(figsize=(6, 5))
    sns.scatterplot(x="total_bill", y="tip", data=tips)
    plt.gcf().tight_layout()
    if saveFig == 'y':
        plt.savefig(Path(path + '/Chapter4/sub_1.pdf'))
        plt.close()
    elif saveFig == 'n':
        plt.show()

    plt.figure(figsize=(6, 5))
    sns.scatterplot(x="total_bill", y="tip", hue="smoker", data=tips)
    plt.gcf().tight_layout()
    if saveFig == 'y':
        plt.savefig(Path(path + '/Chapter4/sub_2.pdf'))
        plt.close()
    elif saveFig == 'n':
        plt.show()

    plt.figure(figsize=(6, 5))
    sns.scatterplot(x="total_bill", y="tip", hue="smoker", style="smoker",
                    data=tips)
    plt.gcf().tight_layout()
    if saveFig == 'y':
        plt.savefig(Path(path + '/Chapter4/sub_3.pdf'))
        plt.close()
    elif saveFig == 'n':
        plt.show()

    plt.figure(figsize=(6, 5))
    sns.scatterplot(x="total_bill", y="tip", hue="size", data=tips)
    plt.gcf().tight_layout()
    if saveFig == 'y':
        plt.savefig(Path(path + '/Chapter4/sub_4.pdf'))
        plt.close()
    elif saveFig == 'n':
        plt.show()
