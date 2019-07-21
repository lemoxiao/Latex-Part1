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
          'ytick.labelsize': 22}
pylab.rcParams.update(params)


if __name__ == '__main__':

    saveFig = input("Do you want to save the figure? (Y/N)")
    while saveFig.lower() not in ('y', 'n'):
        saveFig = input('Please enter only Y or N!')

    fmri = sns.load_dataset("fmri")
    fig = plt.figure(figsize=(12, 10))
    sns.lineplot(x="timepoint", y="signal", data=fmri)
    sns.lineplot(x="timepoint", y="signal", hue="event", data=fmri)

    fig_id = 1

    showAxes = input('Show axis labels? (Y/N)')
    while showAxes.lower() not in ('y', 'n'):
        showAxes = input('Please enter only Y or N!')

    if showAxes.lower() == 'n':
        plt.xlabel('')
        plt.ylabel('')
        fig_id = 2
    elif showAxes.lower() == 'y':
        plt.xlabel('Time point')
        plt.ylabel('Signal')

    plt.gcf().tight_layout()

    if saveFig.lower() == 'y':
        path = str(Path(os.path.abspath(__file__)).parent.parent)
        fig.savefig(Path(path + '/Chapter4/fig_' + str(fig_id) + '.pdf'))
        fig.show()
    elif saveFig.lower() == 'n':
        fig.show()
